//
//  Recipe.swift
//  misRecetas
//
//  Created by sebastian on 5/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject{
    
   //Variables
    
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    var isFavourite : Bool = false
    
     
    init(name: String, time: Int, ingredients: [String], steps: [String], image: UIImage ) {
        self.name = name
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
        self.image = image
    }
}
