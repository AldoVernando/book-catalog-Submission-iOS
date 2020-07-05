//
//  NetworkManager.swift
//  game catalog
//
//  Created by Aldo Vernando on 4/7/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
       
    let gameURL = "https://api.rawg.io/api/games"
}

// MARK: Functions
extension NetworkManager {
    
    
    // fetch movie list
    func getGameList(page: Int, completion: @escaping ([Game]) -> ()) {
        
        let URL = self.gameURL + "?page=\(page)"
        
        AF.request(URL, method: .get).responseDecodable(of: GameList.self) { response in
            guard let games = response.value?.results else { return }
            completion(games)
        }
    }

    
    // fetch movie detail
    func getGameDetail(gameId: Int, completion: @escaping (Game) -> ()) {
        
        let URL = self.gameURL + "/\(gameId)"
        
        print(URL)
        
        AF.request(URL, method: .get).responseDecodable(of: Game.self) { response in
            guard let game = response.value else { return }
            completion(game)
        }
    }
    
    // search movie
    func getGamesWithQuery(query: String, completion: @escaping ([Game]) -> ()) {

        var URL: String = ""

        if query != "" {

            var formatedQuery = query

            if query.contains(" ") {
                formatedQuery = query.replacingOccurrences(of: " ", with: "%20")
            }

            URL = "https://api.rawg.io/api/games?search=\(formatedQuery)"
        } else {
            URL = "https://api.rawg.io/api/games?page=1"
        }

        AF.request(URL, method: .get).responseDecodable(of: GameList.self) { response in
            guard let games = response.value?.results else { return }
            completion(games)
        }
    }
}
