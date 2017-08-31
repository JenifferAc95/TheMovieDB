//
//  MovieFacade.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 8/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import Alamofire

class MovieFacade {
    
    func retrievePopularMovies(completion: @escaping (([Movie]) -> Void)) {
        let popularMovie: String = "https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
        
        Alamofire.request(popularMovie).responseJSON { response in
            if let json = response.result.value as? [String: Any]{
                let movieDictionaries = json["results"] as? [[String: Any]]
                var movies = [Movie]()
                
                for movieDictionary in movieDictionaries! {
                    let newMovie = Movie(movieDictionary: movieDictionary)
                    let base = "https://image.tmdb.org/t/p/w92"
                    let pathMovie = newMovie.poster_path
                    let posterMovie = base + pathMovie!
                    let urlImage = NSURL(string: posterMovie)
                    newMovie.imageUrl = urlImage as URL?
                    
                    self.requestPosterImage(urlPosterImage: posterMovie){ posterImage in
                        newMovie.postImage = posterImage
                        
                    }
                    movies.append(newMovie)
                }
                completion(movies)
            }
        }
    }
    
    func requestPosterImage(urlPosterImage: String, completion: @escaping ((UIImage) -> Void)){
        var imagePoster: UIImage?
        
        Alamofire.request(urlPosterImage).responseData { response in
            if let posterImage = response.result.value {
                imagePoster = (UIImage(data: posterImage))
                print("image ready")
            } else {
                print("Error")
            }
            completion(imagePoster!)
        }
    }
}
