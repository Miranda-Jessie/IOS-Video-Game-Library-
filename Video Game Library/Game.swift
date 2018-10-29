//
//  Game.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 10/29/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

class Game {
    
    enum rating {
        case kids
        case teen
        case everyone
        case mature
        case adultsOnly
    }
    
    enum genre {
        case action
        case RPG
        case adventure
        case horror
    }
    
    enum Availbility {
        case checkedIn
        case checkedOut(dueDate: Date)
    }
    
    
    
    let title: String
    let detail: String
    let rating: String
    let genre: String
    var availability: Availbility
    
    init(title: String, detail: String, rating: String, genre: String) {
        self.title = title
        self.detail = detail
        self.rating = rating
        self.genre = genre
        self.availability = .checkedIn
    }
}
