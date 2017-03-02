//
//  DetailRecipeViewController.swift
//  HayChef
//
//  Created by sebastian on 13/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    //var
    
    var recipe : Recipe!
    
    @IBOutlet var detailRecipeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        detailRecipeImageView.image = recipe.image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailRecipeViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "DetailRecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DetailRecipeViewCell
        
        print(indexPath.row)
        
        switch indexPath.row {
        
        case 0:
            cell.keyLabel.text = "Nombre: "
            cell.valueLabel.text = self.recipe.name!
            
        case 1:
            cell.keyLabel.text = "Tiempo: "
            cell.valueLabel.text = "\(self.recipe.time!)"
        case 2:
            cell.keyLabel.text = "Ingredientes: "
            cell.valueLabel.text = "\(self.recipe.ingredients.count)"
        default:
            break
        }
        
        return cell
        
    }
    
    
}
