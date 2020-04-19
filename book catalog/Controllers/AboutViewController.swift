//
//  AboutViewController.swift
//  book catalog
//
//  Created by TEMP on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        // make circular image
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.black.cgColor
    }

}
