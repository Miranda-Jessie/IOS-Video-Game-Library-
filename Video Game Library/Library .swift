//
//  Library .swift
//  Video Game Library
//
//  Created by Miranda Jessie on 10/29/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

class Library {
    //Singleton
    static let sharedInstance = Library()
    
    var games = [Game]()
    
}
