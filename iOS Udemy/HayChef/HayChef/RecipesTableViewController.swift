//
//  RecipesTableViewController.swift
//  HayChef
//
//  Created by sebastian on 9/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {

    var recipes : [Recipe] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var recipe = Recipe(name: "Pizza", time: 20, ingredients: ["Champiñones","Masa","Pollo","Ketchup"], steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo","Hornear"], image: #imageLiteral(resourceName: "Pizza"))
        
        recipes.append(recipe)
        
        
        
        recipe = Recipe(name: "Hamburguesa",
                        time: 20,
                        ingredients: ["Champiñones","Masa","Pollo","Ketchup"],
                        steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el           pollo","Hornear"],
                        image: #imageLiteral(resourceName: "Hamburguesa"))
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Perro Caliente y Queso gratinado",
                        time: 20,
                        ingredients: ["Champiñones","Masa","Pollo","Ketchup"],
                        steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo","Hornear"],
                        image: #imageLiteral(resourceName: "HotDog"))
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Crepes de Pollo",
                        time: 20,
                        ingredients: ["Champiñones","Masa","Pollo","Ketchup"],
                        steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo","Hornear"],
                        image: #imageLiteral(resourceName: "Crepe"))
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Spaguettis",
                        time: 20,
                        ingredients: ["Champiñones","Masa","Pollo","Ketchup"],
                        steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo","Hornear"],
                        image: #imageLiteral(resourceName: "Spaguetti"))
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Sandwich",
                        time: 20, ingredients: ["Champiñones","Masa","Pollo","Ketchup"],
                        steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo","Hornear"],
                        image: #imageLiteral(resourceName: "Sandwich"))
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Empanadas",
                        time: 20,
                        ingredients: ["Champiñones","Masa","Pollo","Ketchup"],
                        steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo","Hornear"],
                        image: #imageLiteral(resourceName: "Empanada"))
        
        recipes.append(recipe)
        
        print(recipes.count)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.recipes.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Constant about recipe in the position indexPath.row
        let recipe = recipes[indexPath.row]
        
        //Identifier from cell in TableView
        let cellID = "RecipeCell"
        
        //Here use the cell with the indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeTableViewCell
        
        
        //Here, assign the recipe's name in the textLabel
        cell.recipeNameLabel.text = recipe.name!
        cell.recipeTimeLabel.text = "\(recipe.time!) minutos"
        cell.recipeIngredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        cell.recipeImageViewCell.image = recipe.image
        
        
        
        /* if recipe.isFavourite {
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        */
        return cell
    }

    
    /*
     This is a function where you can edit (shared or delete) the row, in this case the recipe
     */
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Declaration of sharedAction constant where you can share the recipe in your social networks
        let sharedAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let sharedDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) a través de #HayChef."
            
            let sharedDefaultImage = self.recipes[indexPath.row].image!
            
            let activityController = UIActivityViewController(activityItems: [sharedDefaultText, sharedDefaultImage], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
        }
        
        sharedAction.backgroundColor = UIColor(red: 157.0/255.0, green: 205.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        //Declaration of deleteAction where you can delete your recipe,
        let deleteAction = UITableViewRowAction(style: .default, title: "Eliminar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        deleteAction.backgroundColor = UIColor(red: 242.0/255.0, green: 82.0/255.0, blue: 82.0/255.0, alpha: 1.0)
        
        return [sharedAction, deleteAction]
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //With this function, you can share information between viewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowRecipeDetail"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailRecipeViewController
                
                destinationViewController.recipe = selectedRecipe
            }
            
        }
        
    }

    

}
