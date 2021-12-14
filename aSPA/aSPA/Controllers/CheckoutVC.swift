//
//  CheckoutVC.swift
//  aSPA
//
//  Created by dmdm on 30/11/2021.
//


import UIKit

class CheckoutVC: UIViewController {
//    Message to customer an appointment has been booked
    var thankYou: String = ""
    
    @IBOutlet weak var thankYouLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        
        thankYouLabel?.text = thankYou
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
