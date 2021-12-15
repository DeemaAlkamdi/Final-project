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
//    var first = ""
//    var last = ""
//    var date = ""
    @IBOutlet weak var thankYouLabel: UILabel!
    @IBOutlet weak var feedbackbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        
        //Localizable
//        thankYouLabel.text = NSLocalizedString(  "Thank you \(first)🤍. We look forward to seeing you at your appointment scheduled on \(date)", comment: "")
        feedbackbtn.setTitle(NSLocalizedString("Please give us your feedback🤩", comment: ""), for: .normal)
        
        thankYouLabel?.text = thankYou
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
