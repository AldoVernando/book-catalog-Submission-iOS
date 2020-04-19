//
//  Book.swift
//  book catalog
//
//  Created by TEMP on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import Foundation

class Book {
    
    var title: String = ""
    var released: String = ""
    var author: String = ""
    var cover_image: String = ""
    var synopsis: String = ""
    
    init(title: String, released: String, author: String, cover_image: String, synopsis: String) {
        self.title = title
        self.released = released
        self.author = author
        self.cover_image = cover_image
        self.synopsis = synopsis
    }
    
}
