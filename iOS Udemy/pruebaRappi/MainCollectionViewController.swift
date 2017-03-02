//
//  MainCollectionViewController.swift
//  pruebaRappi
//
//  Created by sebastian on 24/02/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AppCell"

class MainCollectionViewController: UICollectionViewController {
    
    //Variables
    
    var apps : [App]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.hidesBackButton = false
        navigationItem.title = apps[0].category
        
        
        self.collectionView?.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    /*
     Función que permite preparar el el objeto App para enviar a la siguiente view a través de una segue.
     */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let segueName : String = "showDetail"
        
        if segue.identifier == segueName {
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell){
                
                let selectedApp  = self.apps[indexPath.row]
                
                let destinationViewController = segue.destination as! DetailAppViewController
                
                destinationViewController.app = selectedApp
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    /*
     Method that allow to show the items that is in each section.
     */
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            
            return self.apps.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as!AppCell
        
      
        cell.imageView.image = self.apps[indexPath.row].image
       
      cell.appNameLabel.text = self.apps[indexPath.row].name
       
        
        
       
    
        // Configure the cell
    
        return cell
    }

    

}
