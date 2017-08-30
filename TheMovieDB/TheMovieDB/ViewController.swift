//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var movie = [Movie]()
    
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
    
    func getName(popularMovies: [Movie]) -> [Movie] {
        return popularMovies
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
        
        movie.sort{$0.vote_average! > $1.vote_average!}
        
        let title = movie[indexPath.row].title
        let voteAverage = movie[indexPath.row].vote_average
        let voteAverageF = Float(round(100*voteAverage!)/100)        
        let voteAverageS = String(voteAverageF)
        let imageMovie = movie[indexPath.row].postImage
        
        cell?.titlemovie.text = title
        cell?.overviewMovie.text = voteAverageS
        cell?.imageMovie.image = imageMovie
        cell?.ratingStar.image = #imageLiteral(resourceName: "imageRating")
        return cell!
    }
    
}


