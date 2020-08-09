//
//  GameFavorite.swift
//  game catalog
//
//  Created by Aldo Vernando on 8/9/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import Foundation
import RealmSwift

class GameFavorite: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var background_image: String = ""
    @objc dynamic var rating: Float = 0
    @objc dynamic var gameDescription: String = ""
}
