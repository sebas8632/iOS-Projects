//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Declaracion de variables

var name : String = "Juan Sebastian"
var age : Int = 22
var height : Float = 1.73

var cadena : String = "Hola, soy \(name) y tengo \(age) años, mi estatura es \(height) metros"

//Constants Declaration

let lastName : String = "Florez Saavedra"


// Operadores ++ y --

age += 1
age -= 2

//Bucles con ++ y --

for _ in 0...9{
    print("hola")
}

for i in 0 ..< 10 {
    print(i)
}

//Como se hace una función

func addTwoNumbers (x:Int, y: Int)-> Int{
    return x+y
}

addTwoNumbers(x: 4, y: 3)

//Enums

enum direction{
    
    case north
    case south
    case east
    case west
}

direction.north

//Arrays

var food = ["Pollo", "Pescado", "Croisant"]
food.insert("Spaguettis", at: 3)
food.append("Café")

// Metodos String

var hola = "Yo soy sebastían florez"

hola.contains("ooola")

for i in hola.components(separatedBy: " "){
    print(i)
    }





































