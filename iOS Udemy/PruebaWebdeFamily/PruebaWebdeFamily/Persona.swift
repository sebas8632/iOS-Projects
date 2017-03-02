//
//  Persona.swift
//  PruebaWebdeFamily
//
//  Created by sebastian on 22/02/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation

class Persona: NSObject {
    
    
    var nombre : String
    var apellido : String
    var edad : Int
    var ciudad : String
    var celular : String
    var correo : String
    var password : String
    
    
    
    init(nombre: String, apellido: String, edad: Int, ciudad: String, celular: String, correo: String, password: String) {
        
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
        self.ciudad = ciudad
        self.celular = celular
        self.correo = correo
        self.password = password
    }
    
    
}
