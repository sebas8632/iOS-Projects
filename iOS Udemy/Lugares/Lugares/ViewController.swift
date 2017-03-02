//
//  ViewController.swift
//  misRecetas
//
//  Created by sebastian on 5/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var places : [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        var place = Place(name: "Alexanderplatz", type: "Plaza", location: "Alexanderstraße 4 10178 Berlin Deutschland",telephone: "+555555" ,website: "www.alexanderplatz.com", image: #imageLiteral(resourceName: "alexanderplatz"))
        
        
        places.append(place)
        
        place = Place(name: "Atomium", type: "Museo", location: "Atomiumsquare 1 1020 Brussels Belgium",  telephone: "+555555" ,website: "www.atomium.com",image: #imageLiteral(resourceName: "atomium")
        )
        places.append(place)
        
        place = Place(name: "Big Ben", type: "Torre", location: "London SW1A 0AA England", telephone: "+555555" ,website: "www.bigben.com", image: #imageLiteral(resourceName: "bigben")
        )
        places.append(place)
        
        place = Place(name: "Cristo Redentor", type: "Estatua", location: "Parque Nacional da Tijuca Alto da Boa Vista Rio de Janeiro - RJ 21072 Brasil", telephone: "+555555" ,website: "www.cristoredentor.com", image: #imageLiteral(resourceName: "cristoredentor")
        )
        places.append(place)
        
        place = Place(name: "Mallorca", type: "Ciudad", location: "Mallorca 07140 Sencelles Baleares, España", telephone: "+555555" ,website: "www.mallorca.com",image: #imageLiteral(resourceName: "mallorca")
        )
        places.append(place)
        
        place = Place(name: "Muralla China", type: "Muralla", location: "Province Road 216, Beijing China",telephone: "+555555" ,website: "www.murallachina.com",image: #imageLiteral(resourceName: "murallachina")
        )
        places.append(place)
        
        place = Place(name: "Torre Eiffel", type: "Museo", location: "5 Avenue Anatole 75007 France",telephone: "+555555" ,website: "www.torreeiffel.com", image: #imageLiteral(resourceName: "torreeiffel")
        )
        places.append(place)
        
        place = Place(name: "Torre Pisa", type: "Museo", location: "Leaning Tower of Pisa 56126 Pisa, Province of Pisa Italy", telephone: "+555555" ,website: "www.torrepisa.com", image: #imageLiteral(resourceName: "torrepisa")
        )
        places.append(place)
        
       
        print(places.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Constant about place in the position indexPath.row
        let place = places[indexPath.row]
        
        //Identifier from cell in TableView
        let cellID = "IDPlaceCell"
        
        //Here use the cell with the indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceCell
        
        //Here, assign the place's name in the textLabel
        cell.placeNameLabel.text = place.name
        cell.placeTypeLabel.text = place.type
        cell.placeLocationLabel.text = place.location
        cell.placeImageView.image = place.image
        
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    /*
     This is a function where you can edit the row (insert,delet and other one) and you'll have a delete button
     */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            self.places.remove(at: indexPath.row)
            
        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    /*
     This is a function where you can edit (shared or delete) the row, in this case the place
     */
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Declaration of sharedAction constant where you can share the place in your social networks
        let sharedAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let sharedDefaultText = "Estoy visitando el lugar: \(self.places[indexPath.row].name)"
            
            let activityController = UIActivityViewController(activityItems: [sharedDefaultText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
        }
        
        sharedAction.backgroundColor = UIColor(red: 157.0/255.0, green: 205.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        //Declaration of deleteAction where you can delete your place,
        let deleteAction = UITableViewRowAction(style: .default, title: "Eliminar") { (action, indexPath) in
            
            self.places.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        deleteAction.backgroundColor = UIColor(red: 242.0/255.0, green: 82.0/255.0, blue: 82.0/255.0, alpha: 1.0)
        
        return [sharedAction, deleteAction]
    }
    
    
    //With this function, you can share information between viewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let selectedPlace = self.places[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.place = selectedPlace
            }
            
        }
        
    }
    
    /*
     Función que solo llama el segue para devolverse de una view especifica.
     */
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {
        
    }
    
}
