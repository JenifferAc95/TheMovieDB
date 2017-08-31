//
//  Moview.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 8/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import UIKit


class Movie {
    
    //Properties
    
    var poster_path: String?
    var adult: String?
    var overview: String?
    var release_date: String?
    var genre_ids: [Int]?
    var id: String?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: String?
    var vote_count: String?
    var video: String?
    var vote_average: Float?
    var postImage: UIImage?
    
    init(title: String, overview: String) {
        self.title = title
        self.overview = overview
    }
    
    init(movieDictionary: [String : Any]) {
        self.poster_path = movieDictionary["poster_path"] as? String
        self.adult = movieDictionary["adult"] as? String
        self.overview = movieDictionary["overview"] as? String
        self.release_date = movieDictionary["release_date"] as? String
        self.genre_ids = movieDictionary["genre_ids"] as? [Int]
        self.id = movieDictionary["id"] as? String
        self.original_title = movieDictionary["original_title"] as? String
        self.original_language = movieDictionary["original_language"] as? String
        self.title = movieDictionary["title"] as? String
        self.backdrop_path = movieDictionary["backdrop_path"] as? String
        self.popularity = movieDictionary["popularity"] as? String
        self.vote_count = movieDictionary["vote_count"] as? String
        self.video = movieDictionary["video"] as? String
        self.vote_average = movieDictionary["vote_average"] as? Float
    }
}
