//
//  DetailRecipeViewController.swift
//  HayChef-iOS
//
//  Created by sebastian on 21/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class DetailAppViewController: UIViewController {

    // Variables
    
    var app : App!
    
    @IBOutlet var detailAppImage: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        detailAppImage.image = self.app.image
        
        //Metodos que permiten a una fila tener un tamaño automatico.
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.90)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

        navigationItem.title = self.app.name!
        
        
        self.view.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        self.tableView.backgroundColor = UIColor(red: 30.0/255.0, green: 215.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}


// MARK: - UITableViewDataSource


extension DetailAppViewController : UITableViewDataSource{
 
    /*
     Función que determina el numero de secciones que debe tener la tableview.
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /*
     Función que determina el numero de filas que debe tener la sección del tableView.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    
   
    /*
     Función que permite mostrar la información de cada categoria en la tableViewCell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "DetailAppCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as! DetailAppCell
    
    
        switch indexPath.row {
       
        case 0:
            
            cell.keyLabel.text = "Nombre: "
            cell.valueLabel.text = self.app.name
            
        case 1:
            
            cell.keyLabel.text = "Resumen: "
            cell.valueLabel.text = self.app.summary
            
        case 2:
            
            cell.keyLabel.text = "Tipo: "
            cell.valueLabel.text = self.app.contentType
            
        case 3:
            
            cell.keyLabel.text = "Precio: "
            cell.valueLabel.text = self.app.price
            
        case 4:
            
            cell.keyLabel.text = "Categoria: "
            cell.valueLabel.text = self.app.category
           
            
        case 5:
            
            cell.keyLabel.text = "Derechos: "
            cell.valueLabel.text = self.app.rights
            
            
        default:
            break
        }
        
    return cell
}

}


// MARK: - UITableViewDelegate




extension DetailAppViewController : UITableViewDelegate {
    
   
    /*
     Función que permite definir un titulo para una sección.
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
        var title : String?
       
        if section == 0 {
            title = "Información General"
        }
        
       
        return title
        
    }
    
    /*
     Función que permite definir el color de una celda.
     */

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.4)
    }
    
    
    
}

