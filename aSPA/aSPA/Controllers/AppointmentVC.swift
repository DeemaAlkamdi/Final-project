//
//  AppointmentVC.swift
//  aSPA
//
//  Created by dmdm on 30/11/2021.
//

import UIKit
import Firebase
import FirebaseFirestore

class AppointmentVC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Add Picker View for gueste
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrgueste.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrgueste[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentIndex = row
        guesteTF.text = arrgueste[row]
    }
    @objc func closePicker(){
        guesteTF.text = arrgueste[currentIndex]
        view.endEditing(true)
    }
    
    @IBOutlet weak var guesteTF: UITextField!
    
    let gueste = UIPickerView()
    var arrgueste = [
        "Just me",
        "Two guests",
        "Three guests",
        "Four guests"
    ]
    var currentIndex = 0
    
    
    
    // Appointment schedule
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var numTF: UITextField!
    
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var scheduler: UIDatePicker!
    
    var first = ""
    var last = ""
    var date = ""
    
    @IBAction func saveFirst(_ sender: UITextField) {
        first = firstName.text!
    }
    
    @IBAction func saveLast(_ sender: UITextField) {
        last = lastName.text!
    }
    //   Add date picker
    @IBAction func saveDateTime(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy, h:mm a"
        date = dateFormatter.string(from: scheduler.date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gueste.delegate = self
        gueste.dataSource = self
        guesteTF.inputView = gueste
        
        view.backgroundColor = UIColor(named: "bgColor")
        //        Add toolbar for picker
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let btnDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePicker))
        toolBar.setItems([btnDone], animated: true)
        guesteTF.inputView = gueste
        guesteTF.inputAccessoryView = toolBar
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CheckoutVC
        {
            vc.thankYou =
            "Thank you \(first)🤍. We look forward to seeing you at your appointment scheduled on \(date)"
        }
    }
    
    @IBAction func Done(_ sender: Any) {
        let name = firstName.text!
        let email = lastName.text!
        let password = numTF.text!
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if(error != nil) {
                print(error as Any)
                return
            }
        }
     
    }
}
