//
//  ViewController.swift
//  MillasAMetros
//
//  Created by sebastian on 26/12/16.
//  Copyright © 2016 nhvm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var numberTextFiled: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var segmentControlTo: UISegmentedControl!
    
    let mile : Double = 1.609
    let yard : Double = 1093.61
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertPressed(_ sender: UIButton) {
        
        let indexFrom : Int = segmentedControl.selectedSegmentIndex
        let indexTo : Int = segmentControlTo.selectedSegmentIndex
        let distanceTextField : Double = Double(numberTextFiled.text!)!
        var result : Double = 0.0
        
        
        if indexFrom == 0 {
            if indexTo == 0 { //kilometro a kilometro
            result = distanceTextField
                
            }
            else if indexTo == 1 { //kilometro a milla
                result = distanceTextField/mile
            }else if indexTo == 2 { //kilometro a yarda
                result = distanceTextField*yard
            }
        }
        else if indexFrom == 1 {
            if indexTo == 0 { //Milla a kilometro
                result = distanceTextField*mile
            }
            else if indexTo == 1 { // Milla a milla
                result = distanceTextField
            }else if indexTo == 2 { // Milla a yarda
                result = (distanceTextField*mile)*yard
            }

        }
        else if indexFrom == 2 {
            
            if indexTo == 0 { //Yarda a kilometro
                result = distanceTextField/yard
            }
            else if indexTo == 1 { // Yarda a milla
                
                result = (distanceTextField/yard)/mile
                print (result)
            }
            else if indexTo == 2 { // Yarda a Yarda
            
            result = distanceTextField
            }
        }
        
        convertFrom(fromUnit: indexFrom, toUnit: indexTo, distance: distanceTextField, result: result)

    }


    
    func convertFrom (fromUnit : Int, toUnit : Int, distance : Double, result : Double){
        
        if fromUnit == 0 {
            if toUnit == 0 {
                let initValue = String (format: "%.2f", distance)
                let endValue = String (format: "%.2f", result)
                resultLabel.text = "\(initValue) km = \(endValue) km"
                    }
        else if toUnit == 1 {
            let initValue = String (format: "%.2f", distance)
            let endValue = String (format: "%.2f", result)
            resultLabel.text = "\(initValue) km = \(endValue) millas"

        }else if toUnit == 2 {
            let initValue = String (format: "%.2f", distance)
            let endValue = String (format: "%.2f", result)
            resultLabel.text = "\(initValue) km = \(endValue) yardas"
            }
        }
        else {
            if fromUnit == 1 {
                
                if toUnit == 0 {
                    let initValue = String (format: "%.2f", distance)
                    let endValue = String (format: "%.2f", result)
                    resultLabel.text = "\(initValue) millas = \(endValue) km"
                }
                else if toUnit == 1 {
                    let initValue = String (format: "%.2f", distance)
                    let endValue = String (format: "%.2f", result)
                    resultLabel.text = "\(initValue) millas = \(endValue) millas"
                    
                }else if toUnit == 2 {
                    let initValue = String (format: "%.2f", distance)
                    let endValue = String (format: "%.2f", result)
                    resultLabel.text = "\(initValue) millas = \(endValue) yardas"
                }
            }
            else if fromUnit == 2 {
                if toUnit == 0 {
                    let initValue = String (format: "%.4f", distance)
                    let endValue = String (format: "%.4f", result)
                    resultLabel.text = "\(initValue) yardas = \(endValue) km"
                }
                else if toUnit == 1 {
                    let initValue = String (format: "%.4f", distance)
                    let endValue = String (format: "%.4f", result)
                    resultLabel.text = "\(initValue) yardas = \(endValue) millas"
                    
                }else if toUnit == 2 {
                    let initValue = String (format: "%.4f", distance)
                    let endValue = String (format: "%.4f", result)
                    resultLabel.text = "\(initValue) yardas = \(endValue) yardas"
                }
            }
        }
    }
    
    
    func reloadView(result : Double){
        
        if segmentedControl.selectedSegmentIndex == 0{
            let endValue = String (format: "%.2f", result)
            resultLabel.text = "\(endValue) millas"
        }else{
            
            let endValue = String (format: "%.2f", result)
            resultLabel.text = "\(endValue) kilometros"
        }
        
    }

}

