//
//  ViewController.swift
//  book catalog
//
//  Created by TEMP on 4/19/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let books = BookData().bookDict
    var bookId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
    }

    @IBAction func aboutBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAbout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDetail" {
            if let vc = segue.destination as? DetailViewController {
                if let id = bookId {
                    vc.bookId = id
                }
            }
        }
    }
    
}


// MARK: UITableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        
        if let book = books[indexPath.row] {
        
            cell.cover_image.image = UIImage(named: book.cover_image)
            cell.title.text = book.title
            cell.author.text = book.author
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        bookId = indexPath.row
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
}

