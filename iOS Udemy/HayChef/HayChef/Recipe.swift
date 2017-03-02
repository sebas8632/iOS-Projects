//
//  Recipe.swift
//  HayChef
//
//  Created by sebastian on 9/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {

    var name : String!
    var time : Int!
    var image : UIImage!
    var isFavourite : Bool = false
    var ingredients : [String]!
    var steps : [String]!
    
    init(name: String, time: Int, ingredients: [String], steps: [String], image: UIImage){
        
        self.name = name
        self.time = time
        self.image = image
        self.ingredients = ingredients
        self.steps = steps
    }
}
