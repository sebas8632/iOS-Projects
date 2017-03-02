//
//  DetailViewController.swift
//  misRecetas
//
//  Created by sebastian on 8/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
   
    @IBOutlet var placeImageView: UIImageView!

    
    @IBOutlet var ratingButton: UIButton!
    
    var place : Place!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    
        //Code to change title from navigationBar
        navigationItem.title = self.place.name
        
        placeImageView.image = self.place.image

        // Code to change the background and separator of tableview
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        //Code to estimated row height automaticly
        self.tableView.estimatedRowHeight = 60.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    /*
     Function to navigationBar appear.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /* 
     Function to close a view and return to previous view
    */
    @IBAction func close(segue: UIStoryboardSegue){
        
        if let reviewVC = segue.source as? ReviewViewController{
            
            if let rating = reviewVC.ratingSelected{
                
                let image = UIImage(named: rating)
                
                self.ratingButton.setImage(image, for: .normal)
                
            }
        }
        
    }
    
}




    //MARK: UITableViewDataSource
    
    extension DetailViewController : UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
                      return 5
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cellID = "PlaceDetailViewCell"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceDetailViewCell
            
            cell.backgroundColor = UIColor.clear
            
           
                switch indexPath.row {
            
                case 0:
                    
                    cell.keyLabel.text = "Nombre: "
                    cell.valueLabel.text = self.place.name
                    
                case 1:
                    
                    cell.keyLabel.text = "Tipo: "
                    cell.valueLabel.text = self.place.type
                    
                case 2:
                    
                    cell.keyLabel.text = "Localización: "
                    
                        cell.valueLabel.text = self.place.location
                    
                case 3:
                    cell.keyLabel.text = "Teléfono: "
                    cell.valueLabel.text = self.place.telephone
                    
                case 4:
                    cell.keyLabel.text = "Sitio Web: "
                    cell.valueLabel.text = self.place.website
                    
                default:
                    break
                }
            
            
            
            return cell
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "showMap"{
                
                let destinationViewController = segue.destination as! MapViewController
                destinationViewController.place = self.place
                
            }
        }
        
        
}
        //MARK: UITableViewDelegate
extension DetailViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2:
            
            self.performSegue(withIdentifier: "showMap", sender: nil)
            
        //Hemos seleccionado la geolocalización.
        default:
            break
        }
    }
    
}


