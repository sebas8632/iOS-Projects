//
//  RegisterViewController.swift
//  PruebaWebdeFamily
//
//  Created by sebastian on 22/02/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var lastnameText: UITextField!
    @IBOutlet var ageText: UITextField!
    @IBOutlet var cityText: UITextField!
    @IBOutlet var cellphoneText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var repeatPasswordText: UITextField!
    
    var persona : Persona?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMain" {
            let destinationViewController = segue.destination as! ViewController
            
            destinationViewController.persona = self.persona
        }

    }
    
    @IBAction func registrarButton(_ sender: UIButton) {
        
        let nombre : String = self.nameText.text!
        let apellido : String = self.lastnameText.text!
        let edad : String = self.ageText.text!
        let ciudad : String = self.cityText.text!
        let celular : String = self.cellphoneText.text!
        let correo : String = self.emailText.text!
        let password : String = self.passwordText.text!
        let repeatPassword : String = self.repeatPasswordText.text!
        
        
        if(nombre != "" && apellido != "" && edad != "" && ciudad != "" && celular != "" && correo != "" && password != "" && repeatPassword != "") {
            
            if password != repeatPassword  && (password != "" || repeatPassword != ""){
                
                let alertController : UIAlertController = UIAlertController(title: "Contraseñas no coinciden", message: "Las contraseñas no coinciden", preferredStyle: .alert)
                
                let alertAction : UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(alertAction)
                
                present(alertController, animated: true, completion: nil)
                
            } else{
                
                persona = Persona(nombre: nombre, apellido: apellido, edad: Int(edad)!, ciudad: ciudad, celular: celular, correo: correo, password: password)
                
               
                
                
                performSegue(withIdentifier: "showMain", sender: sender)
            }
            
        } else {
            let alertController : UIAlertController = UIAlertController(title: "Campos Vacios", message: "Debe llenar todos los campos", preferredStyle: .alert)
            
            let alertAction : UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
