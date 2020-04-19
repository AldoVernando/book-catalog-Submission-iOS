//
//  DetailViewController.swift
//  book catalog
//
//  Created by TEMP on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookReleased: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookSynopsis: UILabel!
    
    let books = BookData().bookDict
    var bookId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        bookImage.layer.cornerRadius = 10
        
        if let id = bookId {
            
            if let book = books[id] {
                
                bookImage.image = UIImage(named: book.cover_image)
                bookTitle.text = book.title
                bookReleased.text = book.released
                bookAuthor.text = book.author
                bookSynopsis.text = book.synopsis
            }
        }
        
    }

}
