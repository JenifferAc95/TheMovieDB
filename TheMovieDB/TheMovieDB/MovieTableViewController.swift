//
//  MovieTableViewController.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 9/6/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movie = [Movie]()
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieFacade().retrievePopularMovies(completion: {
            popularMovies in
            print(type(of: popularMovies))
            self.movie = popularMovies
            self.updateUI()
        })
    }
    
    func updateUI(){
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        let movieRow = movie[indexPath.row]
        let voteAverage = movieRow.vote_average
        let voteAverageF = Float(round(100*voteAverage!)/100)
        let voteAverageS = String(voteAverageF)
        let title = movieRow.title
        let urlImage = movieRow.imageUrl
        let year = movieRow.release_date
        
        movie.sort{$0.vote_average! > $1.vote_average!}
        
        cell?.titlemovie.text = title
        cell?.overviewMovie.text = voteAverageS
        cell?.imageMovie.af_setImage(withURL: urlImage!)
        cell?.ratingStar.image = #imageLiteral(resourceName: "imageRating")
        cell?.yearLabel.text = String(year!.characters.prefix(4))
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movie[indexPath.row]
        selectedMovie = movie
        
        performSegue(withIdentifier:  "ShowDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let movieDetailViewController = segue.destination as! MovieDetailViewController
            movieDetailViewController.movie = selectedMovie
            
        }
    }
    
}
