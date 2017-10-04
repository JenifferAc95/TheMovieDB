//
//  CustomTableViewCell.swift
//  
//
//  Created by Jeniffer Acosta Orrego on 8/30/17.
//
//

import UIKit

class CustomTableViewCell: UITableViewCell, MovieDataCell {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var overviewMovie: UILabel!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var ratingStar: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
