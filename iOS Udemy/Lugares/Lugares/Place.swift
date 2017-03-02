//
//  Place.swift
//  Lugares
//
//  Created by sebastian on 20/02/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import Foundation
import UIKit

class Place: NSObject {
    var name = ""
    var type = ""
    var location = ""
    var image : UIImage!
    var rating = "rating"
    var telephone = ""
    var website = ""
    
    init(name: String, type: String, location: String,telephone: String, website: String, image: UIImage ) {
        
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.website = website
        self.telephone = telephone
    }
}
