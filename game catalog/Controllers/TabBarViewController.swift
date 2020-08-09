//
//  TabBarViewController.swift
//  game catalog
//
//  Created by Aldo Vernando on 8/9/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func aboutBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAbout", sender: self)
    }

}
