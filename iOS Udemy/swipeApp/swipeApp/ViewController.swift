//
//  ViewController.swift
//  swipeApp
//
//  Created by sebastian on 23/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se declaran las vistas que se van a mover
        var V1 : View1 = View1(nibName: "View1", bundle: nil)
       
        var V2 : View2 = View2(nibName: "View2", bundle: nil)
        
       var V3 : View3 = View3(nibName: "View3", bundle: nil)

        
        self.addChildViewController(V1)
        self.scrollView.addSubview(V1.view)
        V1.didMove(toParentViewController: self)
        
        self.addChildViewController(V2)
        self.scrollView.addSubview(V2.view)
        V2.didMove(toParentViewController: self)
        
       self.addChildViewController(V3)
        self.scrollView.addSubview(V3.view)
        V3.didMove(toParentViewController: self)

        
        var V2Frame : CGRect = V1.view.frame
        V2Frame.origin.x = self.view.frame.width
        V2.view.frame = V2Frame
        
        
       var V3Frame : CGRect = V3.view.frame
        V3Frame.origin.x = 2 * self.view.frame.width
        V3.view.frame = V3Frame
        
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

