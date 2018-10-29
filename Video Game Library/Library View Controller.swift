//
//  Library View Controller.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 10/29/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let library = Library.sharedInstance
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        library.games.append(Game(
            title: "Blah", detail: "whatever", rating: "1/10", genre: "Everyone"
        )
        )
        tableView.reloadData()
    }
    
    
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return library.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = library.games[indexPath.row].title
        
        return cell
    }
    
    
}


