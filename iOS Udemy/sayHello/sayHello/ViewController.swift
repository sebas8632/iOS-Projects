//
//  ViewController.swift
//  sayHello
//
//  Created by sebastian on 3/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var textFieldController: UITextField!
    @IBOutlet var labelRespuesta: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelRespuesta.text = ""
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func sayHello() -> String {
        
        let name : String = textFieldController.text!
        
        return "Hola ¿como estás \(name)?"
        
    }
    
    @IBAction func saludarButton(_ sender: UIButton) {
        
        let message : String = sayHello()
       
        labelRespuesta.text = message
        
        let alertController : UIAlertController = UIAlertController(title: "Saludo", message: message, preferredStyle: .alert)
        
        let alertAction : UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    

}
