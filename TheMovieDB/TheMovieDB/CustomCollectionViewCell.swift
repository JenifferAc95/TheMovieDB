//
//  CustomCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 9/7/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell, MovieDataCell{
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var overviewMovie: UILabel!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var ratingStar: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    
}
