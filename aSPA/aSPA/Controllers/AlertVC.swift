//
//  AlertVC.swift
//  aSPA
//
//  Created by dmdm on 07/12/2021.
//

import UIKit

class AlertControllers: UIViewController {
    
    @IBOutlet weak var gifimgg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nailGif = UIImage.gifImageWithName("na")
        gifimgg.image = nailGif
    }
    
    @IBAction func btnAlertview(_ sender: Any) {
        postAlertview()
    }
    func postAlertview(){
        let alert = UIAlertController(title: "Sorry!", message: "Please create an account to give feedback", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Create!", style: .default, handler: { action in print("Create clicked")
            
            self.performSegue(withIdentifier: "create", sender: CreateAccountVC.self())
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
