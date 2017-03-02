//
//  Car.swift
//  My Garage
//
//  Created by sebastian on 5/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import Foundation
import UIKit

class Car: NSObject {
    
    //Variables
    
    var cv : Int!
    var marca : String!
    var modelo : String!
    var color : UIColor!
    var kms : Double!
    var image : UIImage?
    
    /*
     Constructor por Defecto
    */
        override init() {
        
        cv = 0
        marca = "Desconocido"
        modelo = "Desconocido"
        color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        kms = 0.0
    }
    
    /*
        Variable de NSObject para describir el objeto
    */
    override var description: String {
        return "Mi carro es un \(marca!) \(modelo!), tiene \(cv!) caballos de potencia y he recorrido \(kms!) kms"
    }
    
    /*
        Constructor para inicialización
    */
    init(cv:Int, marca:String,modelo:String, color:UIColor, kms:Double, image: UIImage?) {
        
        self.cv = cv
        self.marca = marca
        self.modelo = modelo
        self.color = color
        self.kms = kms
        
        if let image = image{
            self.image = image
        }
    }
    
}
