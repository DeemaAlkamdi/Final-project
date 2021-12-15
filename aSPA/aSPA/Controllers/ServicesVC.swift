//
//  ServicesVC.swift
//  aSPA
//
//  Created by dmdm on 30/11/2021.
//

import UIKit

class ServicesVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var costLable: UILabel!
    @IBOutlet weak var continueBtn: UIButton!
    //    Add dictionry
    var servicesDict = [
       NSLocalizedString( "Shellac Manicure&Pedicure    $12", comment: ""): 12,
       NSLocalizedString( "Shellac Manicure& Signature Pedicure   $30", comment: ""): 30,
       NSLocalizedString( "Signature Manicure&Pedicure    $25", comment: "") : 25,
       NSLocalizedString( "Gel Full Set    $35", comment: ""): 35,
       NSLocalizedString( "Foot Massage    $30+", comment: ""): 30,
       NSLocalizedString("Signature Massage    $45+", comment: ""): 45,
       
       NSLocalizedString("Back & Shoulder Massage    $50+", comment: ""): 50,
       NSLocalizedString("Vietnamese Massage    $50+", comment: ""): 50,
        
    ]
    
    var total = 0
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var cost: UILabel!
    
    
    //    sets number of rows = size of dictionary. in this case, 8 rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicesDict.count
    }
    
    //    creates cells with keys from dictionary
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Array(servicesDict)[indexPath.row].key
        cell.selectionStyle = .none
        return cell
    }
    
    //    when rows are selected, adds dictionary value to total array, updates cost text to total
    //    places checkmark
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        total += Array(servicesDict)[indexPath.row].value
        cost.text = "$ \(total)"
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    //    subtracts dictionary value from total array, updates cost text to total
    //    removes checkmark
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        total -= Array(servicesDict)[indexPath.row].value
        cost.text = "$ \(total)"
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate = self
        myTableView.dataSource = self
        view.backgroundColor = UIColor(named: "bgColor")
        
        //Localizable
        costLable.text = NSLocalizedString("TotalCost", comment: "")
        continueBtn.setTitle(NSLocalizedString("Continue", comment: ""), for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
