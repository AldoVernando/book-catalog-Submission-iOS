//
//  ViewController.swift
//  game catalog
//
//  Created by Aldo Vernando on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let network = NetworkManager()
    var games: [Game] = []
    var gameId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.network.getGameList(page: 1, completion: { games in
            self.games = games
            self.tableView.reloadData()
        })
       
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gameCell")
    }

    @IBAction func aboutBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAbout", sender: self)
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
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameTableViewCell
        
        let game = games[indexPath.row]
        
        if let imageURL = game.background_image {
            cell.cover_image.sd_setImage(with: URL(string: imageURL))
        }
        cell.title.text = game.name
        cell.released.text = game.released
        cell.rating.text = String(game.rating)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        gameId = games[indexPath.row].id
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
}


// MARK: UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.network.getGamesWithQuery(query: searchText) { games in
            self.games = games
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}
