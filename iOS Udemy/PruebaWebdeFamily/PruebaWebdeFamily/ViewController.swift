//
//  ViewController.swift
//  PruebaWebdeFamily
//
//  Created by sebastian on 22/02/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    var personas : [Persona] = []
    var persona : Persona?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem?.title = "Volver"
        
        
        
        if persona != nil {
            personas.append(persona!)
        }
        
         persona = Persona(nombre: "Andrés Felipe", apellido: "Gonzales", edad: 21, ciudad: "Manizales", celular: "3206085461", correo: "Andrew1825@hotmail.com", password: "Andres123")
        
        personas.append(persona!)
        
        persona = Persona(nombre: "Claudia Marcela", apellido: "Perez", edad: 24, ciudad: "Manizales", celular: "3206046761", correo: "claudi1234@hotmail.com", password: "elefante")
        
        personas.append(persona!)
        
        persona = Persona(nombre: "Fabian Andrés", apellido: "Alvarez", edad: 22, ciudad: "Pereira", celular: "3186085461", correo: "fandres18@hotmail.com", password: "andrewalva")
        
        personas.append(persona!)
        
        persona = Persona(nombre: "Alberto", apellido: "Guzman", edad: 34, ciudad: "Armenia", celular: "3224585461", correo: "alberto@hotmail.com", password: "alberto")
        
        personas.append(persona!)
        
        print("Numero de personas: \(personas.count)")
            }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func userExist (email: String, password: String) -> Bool{
        
        var resultado : Bool = false
        
        for user in personas {
            
            if user.correo == email {
                
                if user.password == password {
                    print(user.nombre + " " + user.apellido)
                    resultado = true
                } else {
                    print("Contraseña incorracta")
                                   }
            }
        }
        
        return resultado
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showUsers"{
            
            let destinationViewController = segue.destination as! myPeopleTableViewController
            
            destinationViewController.personas = self.personas
            
        }
        
        
       
        
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if self.userNameText.text != "" && self.passwordText.text != "" {
            
            let existe  : Bool = self.userExist(email: self.userNameText.text!, password: passwordText.text!)
            
            if existe {
                performSegue(withIdentifier: "showUsers", sender: sender)
            } else {
                let alertController : UIAlertController = UIAlertController(title: "Datos incorrectos", message: "Has agregado el email o contraseña incorrecta.", preferredStyle: .alert)
                
                let alertAction : UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }

            
        } else {
            
            let alertController : UIAlertController = UIAlertController(title: "Campos Vacios", message: "Es necesario llenar todos los campos", preferredStyle: .alert)
            
            let alertAction : UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
    
    

}

