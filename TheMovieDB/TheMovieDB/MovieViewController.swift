//
//  MovieViewController.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 9/7/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movies = [Movie]()
    var selectedMovie: Movie?
    var collectionView: MovieCollectionView?
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    lazy var movieDataListTableView: MovieTableView = {
        var tableView = MovieTableView()
        self.configureView(movieDataList: tableView)
        return tableView
    }()
    
    lazy var movieDataListCollectionView: MovieCollectionView = {
        var collectionView = MovieCollectionView()
        self.configureView(movieDataList: collectionView)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
        
        MovieFacade.retrievePopularMovies(completion: {
            popularMovies in
            self.movies = popularMovies
            self.movieDataListTableView.reloadData()
        })
    }
    
    func configureView(movieDataList: MovieDataListDataSource) {
        let listView = movieDataList as! UIView
        listView.backgroundColor = UIColor.white
        movieDataList.movieDataSource = self
        view.addSubview(listView)
        listView.addConstraints(toFillSuperView: view)
    }
    
    func changeView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            view.bringSubview(toFront: movieDataListTableView)
        } else {
            view.bringSubview(toFront: movieDataListCollectionView)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieDetailViewController = segue.destination as? MovieDetailViewController {
            movieDetailViewController.movie = selectedMovie
            
        }
        
    }
}

extension MovieViewController: MovieDataSource {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(at section: Int) -> Int {
        return movies.count
    }
    
    func configure(cell: MovieDataCell, atIndex indexPath: IndexPath) {
        
        let movieRow = movies[indexPath.row]
        let urlImage = movieRow.imageUrl
        let voteAverage = movieRow.vote_average
        let voteAverageF = Float(round(100*voteAverage!)/100)
        let voteAverageS = String(voteAverageF)
        let year = movieRow.release_date
        
        movies.sort{$0.vote_average! > $1.vote_average!}
        
        cell.titleMovie.text = movieRow.title//"Jeniffer Jeniffer Jeniffer Jeniffer Jeniffer Jeniffer Jeniffer Jeniffer Jeniffer"
        cell.imageMovie.af_setImage(withURL: urlImage!)
        cell.overviewMovie.text = voteAverageS
        cell.yearLabel.text = String(year!.characters.prefix(4))
        cell.ratingStar.image = #imageLiteral(resourceName: "imageRating")
        
    }
    
    func didSelectItem(indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "ShowMovie", sender: selectedMovie)
    }
}

extension UIView {
    func addConstraints(toFillSuperView superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutFormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutFormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
    }
}
