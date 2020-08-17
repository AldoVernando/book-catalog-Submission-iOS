//
//  FavoriteViewController.swift
//  game catalog
//
//  Created by Aldo Vernando on 8/9/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var games: [GameFavorite] = []
    var gameId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 162
        
        tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gameCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFavorite()
    }

    func getFavorite() {
        let favs = RealmManager.get(data: GameFavorite.self)
        games.removeAll()
        
        if favs.count > 0 {
            
            tableView.isHidden = false
            message.isHidden = true
            
            for fav in favs {
                guard let gameFav = fav as? GameFavorite else { return }
                self.games.append(gameFav)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } else {
            
            message.isHidden = false
            tableView.isHidden = true
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDetail" {
            if let vc = segue.destination as? DetailViewController {
                if let id = gameId {
                    vc.gameId = id
                }
            }
        }
    }

}


// MARK: UITableView
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gameCell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as? GameTableViewCell
        
        let game = games[indexPath.row]
        
        if let cell = gameCell {
        
            cell.cover_image.sd_setImage(with: URL(string: game.background_image))
            cell.title.text = game.name
            cell.released.text = game.released
            cell.rating.text = String(game.rating)
            
            return cell
        }
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        gameId = games[indexPath.row].id
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
}
