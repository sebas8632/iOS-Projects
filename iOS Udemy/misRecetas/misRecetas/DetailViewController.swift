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
   
    @IBOutlet var recipeImageView: UIImageView!

    @IBOutlet var recipeNameLabel: UILabel!
    @IBOutlet var recipeTimeLabel: UILabel!
    @IBOutlet var recipeIngredientsLabel: UILabel!
    @IBOutlet var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    
        //Code to change title from navigationBar
        navigationItem.title = self.recipe.name!
        
        recipeImageView.image = self.recipe.image

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
            return 3
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            switch section {
            case 0:
                return 3
                
            case 1:
                return self.recipe.ingredients.count
                
            case 2:
                return self.recipe.steps.count
                
            default:
                return 0
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cellID = "RecipeDetailViewCell"
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeDetailViewCell
            
            cell.backgroundColor = UIColor.clear
            
            switch indexPath.section {
            
            case 0:
                
                switch indexPath.row {
            
                case 0:
                    
                    cell.keyLabel.text = "Nombre: "
                    cell.valueLabel.text = self.recipe.name!
                    
                case 1:
                    
                    cell.keyLabel.text = "Tiempo: "
                    cell.valueLabel.text = "\(self.recipe.time!) minutos"
                    
                case 2:
                    
                    cell.keyLabel.text = "Es favorito: "
                    
                    if self.recipe.isFavourite == true{
                        cell.valueLabel.text = "Si"
                    }else{
                        cell.valueLabel.text = "No"
                    }
                default:
                    break
                }

                
            case 1:
                
                cell.keyLabel.text = ""
                cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
                
            case 2:
                
                cell.keyLabel.text = "Paso \(indexPath.row+1): "
                cell.valueLabel.text = self.recipe.steps[indexPath.row]
                
            default:
                break
            }
            
            
            
            return cell
        }
}
    
    //MARK: UITableViewDelegate
    extension DetailViewController : UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            var title : String!
            
            switch section {
            case 1:
                
                title = "Ingredientes"
                
            case 2:
                
                title = "Pasos"
            default:
                
                title = ""
            }
            return title
        }
        
        
        
    }


