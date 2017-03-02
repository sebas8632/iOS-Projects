//
//  ViewController.swift
//  pruebaJSON
//
//  Created by sebastian on 25/02/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    var items = [[String:AnyObject]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://www.ralfebert.de/examples/fruits.json")!
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            
            
            let jsonData = try! JSONSerialization.jsonObject(with: data!, options: [])
            self.items = jsonData as! [[String:AnyObject]]
            
            //Aquí el diccionario carga todo del jSON
          // print(self.items)
            
           
            /*DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            */
            
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
           
            
        }
        
        task.resume()
        
        //Aquí el diccionario se imprime vacio
       // print(self.items)
    }
        
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        print(self.items)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func button(_ sender: UIButton) {
        
        print(self.items)
    }
}

