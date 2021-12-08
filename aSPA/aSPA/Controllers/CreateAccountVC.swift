//
//  CreateAccount.swift
//  aSPA
//
//  Created by dmdm on 07/12/2021.
//

import UIKit
import Firebase

class CreateAccountVC: UIViewController{
    

    @IBOutlet weak var customerName: UITextField!
    
    @IBOutlet weak var customerEmail: UITextField!
    
    @IBOutlet weak var customerPassword: UITextField!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        

        
    @IBAction func create(_ sender: Any) {
    
    let email = customerEmail.text!
            let password = customerPassword.text!

            Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
                guard let strongSelf = self else { return }
                if(error != nil) {
                    print(error as Any)
                    return
                }
            }
        }
        
        @IBAction func createAccount(_ sender: Any) {
            let email = customerEmail.text!
            let password = customerPassword.text!
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if(error != nil) {
                    print(error as Any)
                    return
                }
            }
        }
        
        
    }
