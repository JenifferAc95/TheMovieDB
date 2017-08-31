//
//  CollectionViewCell.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 8/31/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var ratingStar: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
