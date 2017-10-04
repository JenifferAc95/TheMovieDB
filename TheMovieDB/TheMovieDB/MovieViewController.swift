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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var movieDataListView: MovieDataListView? {
        didSet{
            let listView = movieDataListView as! UIView
            listView.backgroundColor = UIColor.white
            movieDataListView?.movieDataSource = self
            view.addSubview(listView)
            listView.addConstraints(toFillSuperView: view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDataListView = MovieTableView()
        segmentedControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
        
        MovieFacade.retrievePopularMovies(completion: {
            popularMovies in
            self.movies = popularMovies
            self.movieDataListView?.reloadData()
        })
    }
    
    func changeView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            movieDataListView = MovieTableView()
        } else {
            movieDataListView = MovieCollectionView()
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
        
        cell.titleMovie.text = movieRow.title
        cell.imageMovie.af_setImage(withURL: urlImage!)
        cell.overviewMovie.text = voteAverageS
        cell.yearLabel.text = String(year!.characters.prefix(4))
        cell.ratingStar.image = #imageLiteral(resourceName: "imageRating")
        
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