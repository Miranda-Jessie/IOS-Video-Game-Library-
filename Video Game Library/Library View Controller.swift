//
//  Library View Controller.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 10/29/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


class LibraryViewController: UIViewController {
    
    //Singleton
    let library = Library.sharedInstance
    //tableView
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: LifeCycle
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        //This just adds a game to the starting value in the library
        library.games.append(Game(
            title: "Random Game", detail: "Random Details", rating: .everyone, genre: .horror))
        //A little trick for removing the cell separators
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

//This makes the tableView
extension LibraryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return library.games.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! libraryCell
        let game = library.games[indexPath.row]
        cell.setup(game: game)
        return cell
}
    
    //Checking out a game
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        game.availability = .checkedOut(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! libraryCell).setup(game: game)
    }
    
    //Checking in a game
    func checkIn(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        game.availability = .checkedIn
        (tableView.cellForRow(at: indexPath) as! libraryCell).setup(game: game)
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //This deletes a game
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            
        }
    
    let game = library.games[indexPath.row]
    
    //Adding the ability to swipe left on a cell to check it in and out or delete it
        switch game.availability {
        case .checkedIn:
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                
                self.checkOut(at: indexPath)
                
            }
            
            return [deleteAction, checkOutAction]
            
        case .checkedOut:
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                self.checkIn(at: indexPath)
            }
            
            return [deleteAction, checkInAction]
            
        }
    }
}
//This will show up if you don't have any games in the library
extension LibraryViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "Empty Library")
}

    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "You do not have any games to your library.")
}
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .bold)]
        
        return NSAttributedString(string: "Add Game", attributes: attributes)
}
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        performSegue(withIdentifier: "LibraryToAddGame", sender: self)
}
}
