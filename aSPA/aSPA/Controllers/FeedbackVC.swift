//
//  ViewController.swift
//  aSPA
//
//  Created by dmdm on 07/12/2021.

import UIKit
import Firebase
import FirebaseFirestore

class FeedbackVC: UIViewController {
    
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var commentTF: UITextField!
    @IBOutlet weak var gifsview: UIImageView!
    
    
//    Connect with firebase
    @IBAction func post(_ sender: Any) {
        haB()
    }
    
    func haB() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").setData([
            "name" : nameTF.text as Any,
            "comment" : commentTF.text as Any,
            "id" : currentUserID,
            "userId": Auth.auth().currentUser?.uid,
            
        ],merge: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        
        let gifs = UIImage.gifImageWithName("gifsview")
        gifsview.image = gifs
    
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error as Any)
                    return
                }
                self.nameTF.text = doucument?.data()?["name"] as? String
                self.commentTF.text = doucument?.data()?["comment"] as? String
                
            }
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
   
     }
}
