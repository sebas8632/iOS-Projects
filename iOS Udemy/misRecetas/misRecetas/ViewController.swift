//
//  ViewController.swift
//  misRecetas
//
//  Created by sebastian on 5/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
        var recipe = Recipe(name: "Pizza", time: 20, ingredients: ["Champiñones","Masa","Pollo","Ketchup"], steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo, agragarle sal y refrigerar por cerca de noveinta y cuatro minutos, mientras puedes jugar pokemon GO","Hornear"], image: #imageLiteral(resourceName: "Pizza"))
        
        recipes.append(recipe)
        
        
        
        recipe = Recipe(name: "Hamburguesa",
                        time: 20,
                        ingredients: ["Champiñones","Masa","Pollo","Ketchup"],
                        steps: ["Crear la masa","Redondear la masa", "Poner un poco de ketchup","Desmechar y poner el pollo","Hornear"],
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
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Constant about recipe in the position indexPath.row
        let recipe = recipes[indexPath.row]
        
        //Identifier from cell in TableView
        let cellID = "RecipeCell2"
        
        //Here use the cell with the indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
   
        //Here, assign the recipe's name in the textLabel
        cell.recipeNameLabel.text = recipe.name
        cell.recipeTimeLabel.text = "\(recipe.time!) minutos"
        cell.recipeIngredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        cell.recipeImageView.image = recipe.image
        
        if recipe.isFavourite {
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           let recipe = self.recipes[indexPath.row]
        
        let alertController : UIAlertController = UIAlertController(title: nil, message: "\(recipe.name!)", preferredStyle: .alert)
        
        let cancelAlertAction : UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        var estado : String = "Favorito"
        var alertActionStyle = UIAlertActionStyle.default
        
        if recipe.isFavourite{
            estado = "No Favorito"
            alertActionStyle = UIAlertActionStyle.destructive
        }
        
        
        
        let favouriteAlertAction : UIAlertAction = UIAlertAction(title: estado, style: alertActionStyle) { (action) in
        
         
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        
        alertController.addAction(cancelAlertAction)
        alertController.addAction(favouriteAlertAction)
        
        present(alertController, animated: true, completion: nil)
    
        
    
    }
 */
    
    /*
    This is a function where you can edit the row (insert,delet and other one) and you'll have a delete button
     */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            self.recipes.remove(at: indexPath.row)
            
        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
    }

    /*
     This is a function where you can edit (shared or delete) the row, in this case the recipe
    */
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Declaration of sharedAction constant where you can share the recipe in your social networks
        let sharedAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let sharedDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!)"
            
            let activityController = UIActivityViewController(activityItems: [sharedDefaultText], applicationActivities: nil)
            
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
    
    
    //With this function, you can share information between viewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRecipeDetail"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.recipe = selectedRecipe
            }
        
    }
    
}

}
