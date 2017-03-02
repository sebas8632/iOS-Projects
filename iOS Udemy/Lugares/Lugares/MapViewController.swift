//
//  MapViewController.swift
//  Lugares
//
//  Created by sebastian on 21/02/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var place: Place!
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // se le delegan las funciones del mapView a la clase MapViewController
        self.mapView.delegate = self

        //Se agrega información para el mapa
        self.mapView.showsTraffic = true
        self.mapView.showsScale = true
        self.mapView.showsCompass = true
        

        print("El mapa debe mostrar " + place.name)
        //Se crea la variable de COreLocation
        let geocoder = CLGeocoder()
        
        //Se crea la localización a partir del string que llega como ubicación
        geocoder.geocodeAddressString(place.location) { [unowned self] (placemarks, error) in
            
            if error == nil {
                
                for placemark in placemarks! {
                    
                    //Se crea la anotación la cual se posicionara en la ubicación y mostrará la ubicación del lugar.
                    let annotation = MKPointAnnotation()
                    annotation.title = self.place.name
                    annotation.subtitle = self.place.type
                   
                    // Se posiciona la anotación en el lugar
                    annotation.coordinate = (placemark.location?.coordinate)!
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
                
            } else {
                print("Ha habido un error: \(error?.localizedDescription)")
            }
            
            
        }
        // Do any additional setup after loading the view.
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


extension MapViewController : MKMapViewDelegate {
    
    
    /*
     Función para personalizar anotaciones.
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        let identifier = "MyPin"
        
        //Si la anotación es tipo usuario, no se le hace nada
        if annotation.isKind(of: MKUserLocation.self){
            
            return nil
        }
        
        var annotationView : MKPinAnnotationView? = self.mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        //Si no existe la anotación, se crea y se muestra
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
        imageView.image = self.place.image
        annotationView?.leftCalloutAccessoryView = imageView
        annotationView?.pinTintColor = UIColor.green
        
        return annotationView
        
    }
}
