//
//  Protocol.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 9/7/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation
import UIKit


protocol MovieDataSource {
    
    func numberOfSections()->Int
    func numberOfItems(at section:Int)->Int
    func configure(cell: MovieDataCell, atIndex indexPath: IndexPath)
    func didSelectItem(indexPath: IndexPath)
}

protocol MovieDataCell: class{
    
    var imageMovie: UIImageView! {get set}
    var overviewMovie: UILabel! {get set}
    var titleMovie: UILabel! {get set}
    var ratingStar: UIImageView! {get set}
    var yearLabel: UILabel! {get set}
}

protocol MovieDataListView: class {
    
    func reloadData()
    var movieDataSource: MovieDataSource? {get set}
}

