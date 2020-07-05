//
//  GameTableViewCell.swift
//  game catalog
//
//  Created by Aldo Vernando on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var cover_image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cover_image.layer.cornerRadius = 10
    }

}
