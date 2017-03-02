//
//  ViewController.swift
//  My Garage
//
//  Created by sebastian on 5/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables de la vista
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var marcaLabel: UILabel!
    @IBOutlet var cvLabel: UILabel!
    @IBOutlet var kmsLabel: UILabel!
    
    //Variables del modelo
    
    var myGarage : [Car] = []
    var myCar : Car!
    
    var carID : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        myCar = Car(cv: 80, marca: "Citroen", modelo: "Jumpy", color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), kms: 80000, image: #imageLiteral(resourceName: "citroen"))
        myGarage.append(myCar)

        myCar = Car(cv: 300, marca: "Ferrari", modelo: "Italia", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), kms: 0, image: #imageLiteral(resourceName: "ferrari"))
        myGarage.append(myCar)
        
        myCar = Car(cv: 60, marca: "Fiat", modelo: "500", color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), kms: 200000, image: #imageLiteral(resourceName: "fiat"))
        myGarage.append(myCar)
        
        updateView()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateView(){
        
         myCar = myGarage[carID]
        
        UIView.animate(withDuration: 1.5, delay: 0.25, options: [.curveLinear, .allowUserInteraction], animations: {
            
            if self.myCar.image != nil {
                self.imageView.image = self.myCar.image
            }
            
            self.marcaLabel.text = "\(self.myCar.marca!) \(self.myCar.modelo!)"
            self.cvLabel.text = "CV: \(self.myCar.cv!)"
            self.kmsLabel.text = "Kms: \(self.myCar.kms!)"
            
            self.view.backgroundColor = self.myCar.color
            
        }) { (completed) in
            print("Animación Completada")
        }
        
       
        
        
    }

    
    /*
         Función para cambiar el carro
    */
    @IBAction func changeCar(_ sender: UIButton) {
        
        carID += 1
        
        if carID >= myGarage.count{
            carID = 0
                  }
        updateView()
        
       
        
    }
}

