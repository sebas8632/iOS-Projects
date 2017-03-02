//
//  ViewController.swift
//  HelloWorld
//
//  Created by sebastian on 25/12/16.
//  Copyright © 2016 nhvm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        helloLabel.text = " "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {

        /*let alertController : UIAlertController = UIAlertController(title: "Hola me has pulsado", message: "¡Has pulsado el botón en pantalla!", preferredStyle: .alert )
        
        let okAction : UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
    
        present(alertController, animated: true, completion: nil)*/
        
        let theText = nameTextField.text!
        
        helloLabel.text = "Hola \(theText), ¡Cómo estás?"
        
        let alertController : UIAlertController = UIAlertController(title: "Saludo", message: "Hola \(theText), ¿cómo estás?",
            preferredStyle: .alert)
        
        let okAction : UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
}

