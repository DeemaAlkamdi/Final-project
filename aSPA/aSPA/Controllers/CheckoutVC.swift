//
//  CheckoutVC.swift
//  aSPA
//
//  Created by dmdm on 30/11/2021.
//


import UIKit

class CheckoutVC: UIViewController {
    
    var thankYou: String = ""
    @IBOutlet weak var thankYouLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thankYouLabel?.text = thankYou
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
