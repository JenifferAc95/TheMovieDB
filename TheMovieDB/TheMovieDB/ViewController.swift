//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var movie = [Movie]()
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieFacade().retrievePopularMovies(completion: {
            popularMovies in
            self.movie = popularMovies
            self.updateUI()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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


