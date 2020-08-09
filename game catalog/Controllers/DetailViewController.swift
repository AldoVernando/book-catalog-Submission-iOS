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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var gameDescription: UILabel!
    
    let network = NetworkManager()
    var game: Game?
    var gameId: Int?
    var tempFav: GameFavorite?
    
    let addFavBtn = UIButton(type: .custom)
    let removeFavBtn = UIButton(type: .custom)
    
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
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                    
                    self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.gameDescription.frame.size.height + 150)
                }
            }
               
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        addFavBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        addFavBtn.addTarget(self, action:#selector(self.addToFavorite(sender:)), for: .touchUpInside)
        
        removeFavBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        removeFavBtn.addTarget(self, action:#selector(self.removeFromFavorite(sender:)), for: .touchUpInside)
        
        checkFavorite()
    }
    
    @objc func addToFavorite(sender: UIBarButtonItem) {
        
        let gameFav = GameFavorite()
        
        if let gameData = game {
            gameFav.id = gameData.id
            gameFav.name = gameData.name
            gameFav.released = gameData.released ?? ""
            gameFav.background_image = gameData.background_image ?? ""
            gameFav.rating = gameData.rating
            gameFav.gameDescription = gameData.description ?? ""
        }
        
        RealmManager.insert(data: gameFav)
        let barButton = UIBarButtonItem(customView: removeFavBtn)
        self.navigationItem.rightBarButtonItems = [barButton]
        
        let alert = UIAlertController(title: "Game Added", message: "Game added to favorites", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func removeFromFavorite(sender: UIBarButtonItem) {
        if let fav = tempFav {
            RealmManager.remove(data: fav)
        }
        let barButton = UIBarButtonItem(customView: addFavBtn)
        self.navigationItem.rightBarButtonItems = [barButton]
        
        let alert = UIAlertController(title: "Game Removed", message: "Game removed from favorites", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkFavorite() {
        let favs = RealmManager.get(data: GameFavorite.self)
        
        if favs.count > 0 {
            
            if let id = gameId {

                for fav in favs {
                    if (fav as! GameFavorite).id == id {
                        tempFav = fav as! GameFavorite
                        let barButton = UIBarButtonItem(customView: removeFavBtn)
                        self.navigationItem.rightBarButtonItems = [barButton]
                        return
                    }
                }
            }
        }
    
        let barButton = UIBarButtonItem(customView: addFavBtn)
        self.navigationItem.rightBarButtonItems = [barButton]
        
    }
}
