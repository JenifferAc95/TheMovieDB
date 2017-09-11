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
    
    static func retrievePopularMovies(completion: @escaping (([Movie]) -> Void)) {
        let popularMovie: String = "https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page=1"
        
        Alamofire.request(popularMovie).responseJSON { response in
            if let json = response.result.value as? [String: Any]{
                let movieDictionaries = json["results"] as? [[String: Any]]
                var movies = [Movie]()
                
                self.requestGenreName() { genresList in
                    
                    for movieDictionary in movieDictionaries! {
                        let newMovie = Movie(movieDictionary: movieDictionary)
                        let base = "https://image.tmdb.org/t/p/w154"
                        let baseBack = "https://image.tmdb.org/t/p/w1280"
                        let pathMovie = newMovie.poster_path
                        let pathBckdrop = newMovie.backdrop_path
                        let posterMovie = base + pathMovie!
                        let urlImage = NSURL(string: posterMovie)
                        let urlBackdrop = NSURL(string: baseBack + pathBckdrop!)
                        let genresIds = newMovie.genre_ids
                        
                        newMovie.imageUrl = urlImage as URL?
                        newMovie.backdropUrl = urlBackdrop as URL?
                        
                        let results = genresList.filter{ dict in
                            if let idString = dict["id"] as? Int {
                                let id = Int(idString)
                                return (genresIds?.contains(id))!
                            }
                            return false
                            
                        }
                        for result in results {
                            let genre = result["name"] as? String
                            newMovie.genreNames.append(genre!)
                            //print(genre!)
                        }
                        
                        movies.append(newMovie)                        
                    }
                    completion(movies)
                }
                
            }
            
        }
    }
    
    func requestPosterImage(urlPosterImage: String, completion: @escaping ((UIImage) -> Void)){
        var imagePoster: UIImage?
        
        Alamofire.request(urlPosterImage).responseData { response in
            if let posterImage = response.result.value {
                imagePoster = (UIImage(data: posterImage))
            } else {
                print("Error")
            }
            completion(imagePoster!)
        }
    }
    
    static func requestGenreName(completion: @escaping ([[String:Any]]) -> Void){
        let  genresJson = "https://api.themoviedb.org/3/genre/movie/list?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US"
        
        Alamofire.request(genresJson).responseJSON {response in
            if let json = response.result.value as? [String: Any]{
                let genresList = json["genres"] as? [[String: Any]]
                completion(genresList!)
            }
        }
    }
}




