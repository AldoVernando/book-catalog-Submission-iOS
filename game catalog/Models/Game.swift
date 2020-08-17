//
//  Game.swift
//  game catalog
//
//  Created by Aldo Vernando on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

class Game: Codable {
    
    var id: Int = 0
    var name: String = ""
    var released: String?
    var background_image: String?
    var rating: Float = 0
    var description: String?

}
