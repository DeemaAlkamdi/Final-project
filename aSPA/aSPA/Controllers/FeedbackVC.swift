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
    

    
    @IBAction func post(_ sender: Any) {
        haB()
    }
    
     func haB() {
      guard let currentUserID = Auth.auth().currentUser?.uid else {return}
      Firestore.firestore().document("users/\(currentUserID)").setData([
        "name" : nameTF.text as Any,
        "comment" : commentTF.text as Any,
        "id" : currentUserID,
       
      ],merge: true)
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let nailGiff = UIImage.gifImageWithName("na")
        gifsview.image = nailGiff
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
