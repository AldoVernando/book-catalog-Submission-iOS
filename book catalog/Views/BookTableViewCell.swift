//
//  BookTableViewCell.swift
//  book catalog
//
//  Created by TEMP on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var cover_image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cover_image.layer.cornerRadius = 10
    }

}
