//
//  ReviewViewController.swift
//  misRecetas
//
//  Created by sebastian on 15/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var ratingSelected : String?
    
    @IBOutlet var reviewStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Agragar BlurEffect
        
        
        reviewStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            
            self.reviewStackView.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }, completion: nil)
        */
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.reviewStackView.transform = CGAffineTransform(scaleX: 1, y: 1)

        }, completion: nil)
    }
    
    
    /*
     Action Button to knows what is the button tag, and then send to behind to last view (DetailView)
    */
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            
            ratingSelected = "dislike"
            
        case 2:
            
            ratingSelected = "good"
            
        case 3:
            
            ratingSelected = "great"
            
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
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
