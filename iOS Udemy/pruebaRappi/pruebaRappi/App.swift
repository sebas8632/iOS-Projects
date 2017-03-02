//
//  App.swift
//  pruebaRappi
//
//  Created by sebastian on 24/02/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

class App: NSObject {
    
    //Attributes
    
    var name : String!
    var image : UIImage!
    var summary : String!
    var price : String!
    var contentType : String!
    var rights : String!
    var category : String!
    
    
    /*
     Constructor Method
     */
    init(json: [String:Any]) {
        
        if let containerName = json["im:name"] as? [String:Any],
            let containerSuperImage = json["im:image"] as? [[String:Any]],
            let containerImage = containerSuperImage[2] as? [String:Any],
            let containerSummary = json["summary"] as? [String: Any],
            let containerSuperPrice = json["im:price"] as? [String:Any],
            let containerPrice = containerSuperPrice["attributes"] as? [String:Any],
            let containerSuperType = json["im:contentType"] as? [String:Any],
            let containerType = containerSuperType["attributes"] as? [String:Any],
            let containerRights = json["rights"] as? [String:Any],
            let containerSuperCategory = json["category"] as? [String: Any],
            let containerCategory = containerSuperCategory["attributes"] as? [String:Any]
        
           {
            
            //Convertir una imagen de string a UIImage
            let url = containerImage["label"] as? String
            let urlImage = URL(string: url!)
            do {
                if let data =  try? Data(contentsOf: urlImage!) {
                      self.image = UIImage(data: data)
                }
            }
                self.name = containerName["label"] as? String
                self.summary = containerSummary["label"] as? String
                self.contentType = containerType["label"] as? String
            
                self.price = containerPrice["amount"] as? String
                self.rights = containerRights["label"] as? String
                self.category = containerCategory["label"] as? String
            
            }
    }
    
}
