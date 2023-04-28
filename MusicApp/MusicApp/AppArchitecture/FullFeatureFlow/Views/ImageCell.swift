//
//  ImageCell.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 25/04/23.
//

import UIKit

let reuseIdentifier = "testCell"
let imageCell = "ImageCell"

class ImageCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
//    required init(coder aDecoder: NSCoder!) {
//            super.init(coder: aDecoder)
//        }
//
//        override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
