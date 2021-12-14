//
//  FirstInterfaceVC.swift
//  aSPA
//
//  Created by dmdm on 13/12/2021.
//

import UIKit



class FirstInterfaceVC: UIViewController{
    
//   gesture recognizer for background color
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
    
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(background)
        )
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
        view.isUserInteractionEnabled = true
    }
        
        
@objc func background() {
   
    view.backgroundColor = UIColor (named: "background")
}

}
