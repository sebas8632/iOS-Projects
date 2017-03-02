//
//  AddPlaceViewController.swift
//  Lugares
//
//  Created by sebastian on 23/02/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class AddPlaceViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameText: UITextField!
    @IBOutlet var typeText: UITextField!
    @IBOutlet var locationText: UITextField!
    @IBOutlet var numberphoneText: UITextField!
    @IBOutlet var websiteText: UITextField!
    
    @IBOutlet var dontLikeButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var loveItButton: UIButton!
    
    var rating : String?
    
    let defaultColor = UIColor(red: 240.0/255.0, green: 113.0/255.0, blue: 116.0/255.0, alpha: 1.0)
    let selectedColor = UIColor.blue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameText.delegate = self
        self.typeText.delegate = self
        self.locationText.delegate = self
        self.numberphoneText.delegate = self
        self.websiteText.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    /*
        Función que permite seleccionar la imagen para agregar una nueva imagen con ImagePickerController.
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            //Hay que gestionar la selección de la imagen del lugar
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    /*
     Función que al finalizar la selección de la imagen la muestra en la imageView, además le adapta las constraint para que se adapte al tamaño de la superview.
    */
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
       
        // Se organizan los constraint de la imageView
        let leadingConstraint = NSLayoutConstraint(item: self.imageView, attribute: .leading, relatedBy: .equal, toItem: self.imageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: self.imageView, attribute: .trailing, relatedBy: .equal, toItem: self.imageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self.imageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .equal, toItem: self.imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
     Función que permite ocultar el teclado cuando se oprime la tecla return.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
     Función que permite guardar un lugar especifico.
     */
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        if let name = self.nameText.text,
            let type = self.typeText.text,
            let location = self.locationText.text,
            let telephone = self.numberphoneText.text,
            let website = self.websiteText.text,
            let theImage = self.imageView.image,
            let rating = self.rating{
            
            let place = Place(name: name, type: type, location: location, telephone: telephone, website: website, image: theImage)
            place.rating = rating
            print(place.name)
            
            self.performSegue(withIdentifier: "unwindToMainViewController", sender: self)
            
        } else {
            let alertController : UIAlertController = UIAlertController(title: "Falto algún campo", message: "Revisa que lo tengas todo configurado", preferredStyle: .alert)
            let alertAction : UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    /*
     Función que permite obtener el rating que se ha seleccionado y cambiar el color del botón oprimido.
     */
    @IBAction func ratingButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            self.rating = "No me gusta"
            self.dontLikeButton.backgroundColor = selectedColor
            self.likeButton.backgroundColor = defaultColor
            self.loveItButton.backgroundColor = defaultColor
        case 1:
            self.rating = "Me gusta"
            self.dontLikeButton.backgroundColor = defaultColor
            self.likeButton.backgroundColor = selectedColor
            self.loveItButton.backgroundColor = defaultColor
        case 2:
            self.rating = "Me encanta"
            self.dontLikeButton.backgroundColor = defaultColor
            self.likeButton.backgroundColor = defaultColor
            self.loveItButton.backgroundColor = selectedColor
        default:
            break
        }
    }
}
