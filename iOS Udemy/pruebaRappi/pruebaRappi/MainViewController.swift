//
//  MainViewController.swift
//  pruebaRappi
//
//  Created by sebastian on 27/02/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    //Variables
    
    var json = [String:AnyObject]()
    
    var apps : [App]! = []
    
    var currentApps : [App]! = []
    
    var categories : [String]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Carga el JSON desde una URL
        loadJSONFromURL()
        // Guarda las aplicaciones que estan en el JSON en un array.
        saveJSONToArray(json: self.json)
        
        // Guarda todas las categorias de una app.
        saveCategories()
        
       
        self.view.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
        self.tableView.backgroundColor = UIColor(red: 30.0/255.0, green: 215.0/255.0, blue: 96.0/255.0, alpha: 1.0)
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     Función que permite cargar todos los datos del JSON.
     */
    func loadJSONFromURL() {
        
        let semaphore = DispatchSemaphore.init(value: 0)
        
        let url = URL(string: "http://itunes.apple.com/us/rss/topfreeapplications/limit=20/json")!
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            
            do {
                
                if let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject] {
                    
                    self.json = jsonData
                    
                    semaphore.signal()
                    
                }
                
            }
            catch {
                
            }
            
            OperationQueue.main.addOperation {
                self.tableView?.reloadData()
            }
            
            
        }
        
        task.resume()
        semaphore.wait()
        
    }

    
    
    /*
     Función que permite guardar los archivos de un json a un arrayList.
     */
    func saveJSONToArray(json: [String: AnyObject])  {
        
        if let feeds = json["feed"] as? [String:AnyObject], let entries = feeds["entry"] as? [[String:AnyObject]] {
            
            for entry in entries {
                let app = App(json: entry)
                self.apps.append(app)
            }
            
        }
        
    }

    
    /*
     Función que permite guardar las categorias de todas las apps.
    */
    func saveCategories() {
        
        for app in self.apps {
            if app == apps[0] {
                categories.append(app.category)
            }
            
            if !categoryExists(category: app.category) {
                categories.append(app.category)
            }
            
        }
    }
    
    /*
     Función que permite verificar si ya existe una categoría y returnar true si ya existe.
    */
    func categoryExists(category: String) -> Bool {
        
        var exist : Bool = false
        
        for objCategory in self.categories {
            if objCategory == category {
                exist = true
            }
        }
        return exist
        
    }
    
    /*
     Función que permite buscar aplicaciones por categoria.
     */
    func findAppsForCategory(category: String) -> [App] {
        
        var currentApps: [App] = []
        
        for app in self.apps {
            if app.category == category {
                currentApps.append(app)
            }
        }
        
        return currentApps
    }
    
    
    // MARK: - Navigation

     /*
     Función que permite preparar el arraylist currentApps para enviar a la siguiente view a través de una segue.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let segueName : String = "showApps"
        
        if segue.identifier == segueName {
            
            if let indexPath = self.tableView?.indexPathForSelectedRow{
                
                let currentApps  = self.findAppsForCategory(category: categories[indexPath.row])
                
                let destinationViewController = segue.destination as! MainCollectionViewController
                
                destinationViewController.apps = currentApps
            }
        }
    }
    
    
   
   
}

    //MARK: - UITableViewDataSource

extension MainViewController : UITableViewDataSource {
   
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
        return self.categories.count
    }
    
    /*
        Función que permite mostrar la información de cada categoria en la tableViewCell
     */
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "categoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as! CategoryCell
        
        cell.categoryLabel.text = categories[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.imageCategory.image = #imageLiteral(resourceName: "Visual Game Boy Filled-50")
        case 1:
            cell.imageCategory.image = #imageLiteral(resourceName: "Swiss Army Knife Filled-50")
            
        case 2:
            cell.imageCategory.image = #imageLiteral(resourceName: "Google Images Filled-50")
        case 3:
            cell.imageCategory.image = #imageLiteral(resourceName: "MySpace Filled-50")
            
        case 4:
            cell.imageCategory.image = #imageLiteral(resourceName: "North Direction Filled-50")
        case 5:
            cell.imageCategory.image = #imageLiteral(resourceName: "Airport Filled-50")
            
        case 6:
            cell.imageCategory.image = #imageLiteral(resourceName: "Musical Notes-50")
        case 7:
            cell.imageCategory.image = #imageLiteral(resourceName: "Happy Filled-50")
            
        case 8:
            cell.imageCategory.image = #imageLiteral(resourceName: "Literature Filled-50")
        case 9:
            cell.imageCategory.image = #imageLiteral(resourceName: "Buy Filled-50")
        
        case 10:
            cell.imageCategory.image = #imageLiteral(resourceName: "Calculator Filled-50")
            
            
        default:
            break
        }
        
        
        return cell
    }
}
    //MARK: - TableViewDelegate


extension MainViewController : UITableViewDelegate {
    
    
    /*
     Función que permite definir el color de una celda.
     */
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.4)
    }
    
    
    /*
     Función que permite definir el color de una celda cuando se selecciona.
     */
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CategoryCell
        
        cell.contentView.backgroundColor = UIColor(red: 132.0/255.0, green: 189.0/255.0, blue: 2.0/255.0, alpha: 1)
    }
    
    /*
     Función que permite definir el color de una celda cuando se de-selecciona.
     */
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CategoryCell
        cell.contentView.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.4)
    
    }
    
    /*
     Función que permite definir un titulo para una sección.
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title : String?
        
        if section == 0 {
            title = "Categorias"
        }
        
        
        return title
    }
    
}
