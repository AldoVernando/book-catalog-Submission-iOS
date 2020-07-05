//
//  DetailViewController.swift
//  game catalog
//
//  Created by Aldo Vernando on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameReleased: UILabel!
    @IBOutlet weak var gameRating: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    let network = NetworkManager()
    var game: Game?
    var gameId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        gameImage.layer.cornerRadius = 10
        
        
        if let id = gameId {
            
            network.getGameDetail(gameId: id) { game in
                self.game = game
                if let imageURL = game.background_image {
                    self.gameImage.sd_setImage(with: URL(string: imageURL))
                }
                self.gameTitle.text = game.name
                self.gameReleased.text = game.released
                self.gameRating.text = String(game.rating)
                self.gameDescription.text = game.description
            }
               
        }
        
    }

}
