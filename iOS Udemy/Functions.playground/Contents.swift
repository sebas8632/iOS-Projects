import Foundation

func sayHello(){
    //Cuerpo del metodo
    
    let date = Date()
    print("Hola, ahora son: \(date)")
}


sayHello()


func realizarPregunta(time: Int,name: String){
    print("Hola \(name) ¿Está es la \(time) que preguntas eso?")
}

realizarPregunta(time: 3
    , name: "Fabián")



///////////////////////


func power2 (number:Int) -> Int {
    return (number*number)
}
/**
 Función que permite elevar un numero base a exponente especifico.
 */
func elevar (base:Int,exponent:Int) -> Int {
    
    var result : Int = 1
    
    for _ in 1...exponent {
            result = result * base
    }
    
    return result
}

print(elevar(base: 5, exponent: 4))


///////////////////////////

/// Tuplas ///


func getProduct (idProduct: Int) -> (id : String,name : String,price : Double){
    
    var id = "IPH0", name = "IPhone 5", price = 599.99
    
    switch idProduct {
    case 1:
        id = "IPH6"
        name = "IPhone 6"
        price = 699.99
        
    case 2:
        id = "IPDA"
        name = "IPad Air"
        price = 499.90
        
    case 3:
        id = "IPH7"
        name = "IPhone 7"
        price = 799.99
    default:
        break
    }
    return (id,name,price)
}

let product = getProduct(idProduct: 1)


print("El producto \(product.name) tiene un precio de \(product.price)")




print("---------------------------------------")

func stocksWithID(id:String) -> (idEnterprise : String, name:String, price:Double){
    
    var idEnterprise = "HCF",
        name = "HayChef",
        price = 2.99
    switch id {
    
    case "APPL":
        idEnterprise = "AAPL"
        name = "Apple"
        price = 116.19
        
    case "GOOG":
        idEnterprise = "GOOG"
        name = "Google"
        price = 786.05
        
    case "FB":
        idEnterprise = "FB"
        name = "Facebook"
        price = 118.05
        
    case "TW":
        idEnterprise = "TW"
        name = "Twitter"
        price = 16.73
    default:
        break
    }
    
    return (idEnterprise,name,price)

}


let action = stocksWithID(id: "FB")

print("La acción en bolsa de \(action.name) con identificación \(action.idEnterprise) tiene un precio de \(action.price) dolares")

