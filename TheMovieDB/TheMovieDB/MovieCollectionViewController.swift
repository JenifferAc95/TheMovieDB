//
//  MovieCollectionViewController.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 8/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MovieCollectionViewController: UICollectionViewController {
    var movie = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        MovieFacade().retrievePopularMovies(completion: {
            popularMovies in
            self.movie = popularMovies
            self.updateUI()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUI(){
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nibName = UINib(nibName: "CollectionViewCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "cell")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
        
        let title = movie[indexPath.row].title
        let voteAverage = movie[indexPath.row].vote_average
        let voteAverageF = Float(round(100*voteAverage!)/100)
        let voteAverageS = String(voteAverageF)
        let imageMovie = movie[indexPath.row].postImage
        
        movie.sort{$0.vote_average! > $1.vote_average!}
        
        cell?.titleMovie.text = title
        cell?.ratingLabel.text = voteAverageS
        cell?.imageMovie.image = imageMovie ?? #imageLiteral(resourceName: "iTunesArtwork")
        cell?.ratingStar.image = #imageLiteral(resourceName: "ratingStar")
    
        return cell!
    }
}
