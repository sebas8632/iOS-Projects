//: Playground - noun: a place where people can play

import UIKit
import Foundation
var birthday : Double = 11

var e : Double = 2.718281828

Double(birthday)+e
Int(birthday)+Int(e)


//Librería Foundation


pow(Double(birthday), 2)
sqrt(Double(birthday))

birthday = Double(birthday) + 0.6487
ceil(birthday)
floor(birthday)

birthday += 1.0
birthday-=2.0

var isWoman : Bool = false
var result : Int

if isWoman{
    
    print (2+2)
}
else{
    print(2+4)
}


var x : Double = 2.8
var y : Double = 2.6

if x < y {
    print ("X es menor que Y")
}
else{
    if x == y{
        print ("X es igual a Y")
    }
    else{
        print ("X es mayor a Y")
    }
}


/* Ejercicios con Switch
 */

var dayOfTheWeek : String = "sabado"

switch dayOfTheWeek {

case "Lunes":
    print("Faltan 4 días para que sea Viernes")
case "Martes":
    print("Faltan 3 días para que sea Viernes")
case "Miercoles":
    print("Faltan 2 días para que sea Viernes")
case "Jueves":
    print("Faltan 1 días para que sea Viernes")
case "Viernes":
    print("Hoy es Viernes")
default:
    print("No has seleccionado ningún día valido")
}


//Varios case

var character : String = "b"

switch character {
case "a","e","i","o","u":
    print("Es una vocal")
default:
    print("No es una vocal")
}

var speed : Int = -5

switch speed {
case 0...60:
    print("Muy Despacio")
case 61...80:
    print("Velocidad normal")
case 81...100:
    print("Velocidad de Crucero")
default:
    print("Velocidad no valida")
}


// Ejercicio con switch

var number : Int = 7

switch number {
case 2,3,5,7:
    print("\(number) es numero primo")
default:
    print("\(number) no es numero primo")
}


var hour : Int = 13


switch hour {
case 00...06:
    print("Es madrugada")
case 07...12:
    print("Es mañana")
case 12...14:
    print("Es mediodía")
case 14...18:
    print("Es tarde")
case 18...24:
    print("Es noche")
default:
    print("No es una hora valida")
}







