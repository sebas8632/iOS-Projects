//
//  myRecipesTableViewController.swift
//  HayChef-iOS
//
//  Created by sebastian on 18/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class myPeopleTableViewController: UITableViewController {

   var personas : [Persona]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
       // navigationItem.hidesBackButton = true
        navigationItem.title = "Personas"
        
       
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.personas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Constant about recipe in the position indexPath.row
        let persona = self.personas[indexPath.row]
        
        //Identifier from cell in TableView
        let cellID = "PersonaCell"
        
        //Here use the cell with the indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PersonaCell
        
        //Here, assign the recipe's name in the textLabel
        
        cell.nameLabel.text = persona.nombre
        cell.lastNameLabel.text = persona.apellido
        cell.ageLabel.text = "\(persona.edad) Años"
        cell.cityLabel.text = persona.ciudad
        cell.emailLabel.text = persona.correo
        cell.cellphoneLabel.text = persona.celular
        
               return cell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
        

}
