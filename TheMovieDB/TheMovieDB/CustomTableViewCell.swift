//
//  CustomTableViewCell.swift
//  
//
//  Created by Jeniffer Acosta Orrego on 8/30/17.
//
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var overviewMovie: UILabel!
    @IBOutlet weak var titlemovie: UILabel!
    @IBOutlet weak var ratingStar: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
