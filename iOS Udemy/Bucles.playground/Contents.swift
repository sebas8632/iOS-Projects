//Bucle For

for var i in 1...10 {
    print("Numero es \(i)")
}

for var i in 1..<10 {
    print("Numero es \(i)")
}


for var i in (1...10).reversed() {
    print("Numero es \(i)")
}

//Ejercicios con bucle for

//1. Crear un bucle que vaya de 1 a 100 e imprima 

for var i in 1...100 {
    print("Voy por la iteración \(i)")
}

for var i in (1...100).reversed() {
    print("Tengo \(i) cervezas en la despensa")
}

// Bucle While

print("=====================")

var x : Int! = 17
var y : Int! = 2
var isDivisible : Bool = false

while y<x && !isDivisible {

    if x % y == 0 {
        isDivisible = true
    }
    else{
    
        y = y+1
    }
    
}

if isDivisible {
    
    
    print("El número \(x) tiene como divisores \(y)")
}
else{
    print("El numero \(x) es un numero primo y no tiene divisor")
}




//Bucles para recorrer arrays


var nombres : [String] = ["Juan","Sebastián","Andrés","Fabián","Thomas"]

for var i in 0..<nombres.count {
    print("El nombre \(i) es \(nombres[i])")
}

//foreach

for nombre in nombres {
    print("\(nombre)")
}

//Recorrido con While

var i : Int = 0

while i < nombres.count {
    print("El nombre \(i) es \(nombres[i])")
    i += 1
}



//Ejercicio

var favoritesMovies : [String] = ["Rey León", "Inception", "Harry Potter", "Batman: El Caballero de la Noche", "Volver al Futuro"]
var movie : String = "Rey León"

for var i in 0..<favoritesMovies.count {
    
    if favoritesMovies[i] == movie {
        print("Mi pelicula favorita esta en la posición \(i) y es \(favoritesMovies[i])")
        break
    }
    else{
        print("No se encuentra \(movie)")
        break
    }
}

// Bucles para recorrer diccionarios


var extras : [String:Double] = ["Salchichas" : 0.4,
                                "Queso" : 0.6,
                                "Maiz" : 0.5]


for (key,value) in extras {
    print("El valor de adicionar \(key) es de \(value)")
}


for key in extras.keys {
    print("El extra \(key) cuesta \(extras[key]!)")
}


//Ejercicio

var foods : [String:Float] = ["Pollo": 5.3,
                             "Carne":6.2,
                             "Arroz":1,
                             "Salchicha":2.3,
                             "Cerdo":7.5]


for (key,value) in foods {
    print("El articulo \(key) tiene un valor de: \(value)")
    foods[key] = value*0.9
    
    
    if foods[key]! < Float(1) {
        
        foods[key] = 1.12
    }
    print("El articulo \(key) con el descuento del 10% tiene un valor de: \(foods[key]!)")
    
}


