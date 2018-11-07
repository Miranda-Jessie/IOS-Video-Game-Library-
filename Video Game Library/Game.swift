//
//  Game.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 10/29/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

class Game {
    
    enum Rating: String {
        case kids = "K"
        case teen = "T"
        case everyone = "E"
        case mature = "M"
        case adultsOnly = "AO"
        case notRated = "NR"
    }
    
    enum Genre: String {
        case action = "action"
        case RPG = "RPG"
        case adventure = "adventure"
        case horror = "horror"
    }
    
    enum Availability {
        case checkedIn
        case checkedOut(dueDate: Date)
    }

    
    
    var title: String = ""
    var detail: String = ""

    var rating: Rating
    
    var genre: Genre
    var availability: Availability
    
    init(title: String, detail: String, rating: Rating, genre: Genre) {
        self.title = title
        self.detail = detail
        self.availability = .checkedIn
        self.rating = rating
        self.genre = genre
    }
}
