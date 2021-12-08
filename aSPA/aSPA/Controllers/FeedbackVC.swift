//
//  ViewController.swift
//  aSPA
//
//  Created by dmdm on 07/12/2021.

import UIKit
import Firebase
import FirebaseFirestore

class FeedbackVC: UIViewController {
    
    
    @IBOutlet weak var ratingfinal: RatingController!
    @IBOutlet weak var commentTF: UITextField!
    @IBOutlet weak var gifsview: UIImageView!
    
    @IBOutlet weak var ratingStackView: RatingController!
    
    @IBAction func post(_ sender: Any) {
        haB()
    }
    
     func haB() {
      guard let currentUserID = Auth.auth().currentUser?.uid else {return}
      Firestore.firestore().document("users/\(currentUserID)").setData([
        "comment" : commentTF.text as Any,
        "id" : currentUserID,
        "rating" :ratingfinal.starsRating as Any,
       
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
                self.commentTF.text = doucument?.data()?["comment"] as? String
                  self.ratingfinal.starsRating = doucument?.data()?["rating"] as! Int
                
              }
          
          
        
        
        
        
        
        
        let nailGiff = UIImage.gifImageWithName("na")
        gifsview.image = nailGiff
    }
    
    
    @IBAction func Howmanyclickedstar(_ sender: Any) {
        print(ratingStackView.starsRating)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
