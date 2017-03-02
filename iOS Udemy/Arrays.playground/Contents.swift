//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Arrays 

var myShoppingList : [String] = ["Platanos","Arroz","Pollo","Queso"]

myShoppingList.append("Carne")
myShoppingList.count

myShoppingList[myShoppingList.count-1]

myShoppingList[1] = "Arroz Integral"
myShoppingList

myShoppingList.insert("Brócoli", at: 0)

myShoppingList.remove(at: 3)
myShoppingList

myShoppingList.contains("Arroz Integral")
myShoppingList.index(of: "Platanos")


myShoppingList.removeAll()

myShoppingList += ["Chuleta","Pescado","Champiñones","Sopa","Perro Caliente"]

myShoppingList[1...3]


// Diccionarios

var dictionary : [Int : String] = [0 : "Hola",1 : "Que más"]

dictionary[1]


dictionary[3] = "Perro"
dictionary

var guitars : [Int : String] = [:]

var bigEntreprises : [String : String] = ["AAPL" : "Apple",
                                          "GOOG" : "Google", "AMZN" : "Amazon"]

bigEntreprises["FB"] = "Facebook"
bigEntreprises["TW"] = "Twitter"




var birthdays : [String : String] = ["Sebastián Florez" : "11-08-1994","Laura Méndez" : "24-04-1997","Fabian Osorio" : "08-09-1994"]

birthdays["Juan Gabriel Gomila"] = "19-05-1888"
birthdays

if let oldBirthday = birthdays["Juan Gabriel Gomila"]{
    birthdays.updateValue("19-05-1988", forKey: "Juan Gabriel Gomila")
        print(oldBirthday)
}

if let removedBirthday =     birthdays.removeValue(forKey: "Juan Gabriel Gomila")
{
    print("Se ha eliminado el valor \(removedBirthday)")

}

































