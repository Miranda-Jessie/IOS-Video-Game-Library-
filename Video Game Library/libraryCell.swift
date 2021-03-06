//
//  libraryCell.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 11/1/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import UIKit

class libraryCell: UITableViewCell {

    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var genreCell: UILabel!
    @IBOutlet weak var dueDateCell: UILabel!
    @IBOutlet weak var ratingCell: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    func setup(game: Game) {
        
        titleCell.text = game.title
        
        
        //Genres being set depending on what the user chooses
        switch game.genre {
        case .action:
            genreCell.text = "Action"
        case .adventure:
            genreCell.text = "Adventure"
        case .horror:
            genreCell.text = "Horror"
        case .RPG:
            genreCell.text = "Role Playing Game"
        }
        
        //Rating being set based on what the user chooses - using the raw value to save time
        ratingCell.text = game.rating.rawValue
        
        switch game.availability {
        case .checkedIn:
            // Hide due date
            dueDateCell.isHidden = true
            //Set view to green
            viewCell.backgroundColor = .green
            
        case .checkedOut(let date):
            //show due date
            dueDateCell.isHidden = false
            //set view to red
            viewCell.backgroundColor = .red
            //set dueDate to formatted date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            dueDateCell.text = dateFormatter.string(from: date)
        }
    }
}

