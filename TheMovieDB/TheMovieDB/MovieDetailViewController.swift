//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 9/1/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var movieUIImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingStartImage: UIImageView!
    @IBOutlet weak var overviewText: UITextView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = movie?.title
        let moviesGenres = movie?.genreNames
        let voteAverageF = Float(round(100*(movie?.vote_average)!)/100)
        let voteAverageS = String(voteAverageF)
        
        titleLabel.text = movie?.title
        movieUIImage.af_setImage(withURL: (movie?.backdropUrl)!)
        ratingLabel.text = voteAverageS
        ratingStartImage.image = #imageLiteral(resourceName: "imageRating")
        overviewText.text = movie?.overview
        releaseDateLabel.text = movie?.release_date
        genresLabel.text = moviesGenres?.joined(separator: ", ")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
