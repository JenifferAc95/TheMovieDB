//
//  MovieFacade.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 8/23/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire

class MovieFacade {
    
    let popularMovie: String = "https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
    
    func retrievePopularMovies() {
        
        Alamofire.request(popularMovie).responseJSON { response in
            if let json = response.result.value as? [String: Any]{
                let movieDictionaries = json["results"] as? [[String: Any]]
                var movies = [Movie]()
                let title = movieDictionaries
                
                for movieDictionary in movieDictionaries! {
                    let newMovie = Movie(movieDictionary: movieDictionary)
                    movies.append(newMovie)
                }
                
                print(title!)
            }
        }
    }
}
