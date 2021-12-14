//
//  ReviewVC.swift
//  aSPA
//
//  Created by dmdm on 08/12/2021.
//

import UIKit
import FirebaseFirestore
import Firebase


class ReviewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    variables for user struct
    var users : Array<User> = []
//
    @IBOutlet weak var tableview: UITableView!
//    table view for customer feedback
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath) as! ReviewCell
        let data = users[indexPath.row]
        cell.nameLabel.text = data.name
        cell.commentLabel.text = data.comment
        cell.IlikeItbtn.tag = indexPath.row
        cell.IlikeItbtn.addTarget(self, action: #selector(IlikeIt(sender: )), for: .touchUpInside)

        return cell
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         let cell = users[indexPath.row]
         let alertcontroller = UIAlertController(title: "Delete"
                             , message: "Are you sure you want to delete this comment?"
                             , preferredStyle: UIAlertController.Style.alert
         )
            alertcontroller.addAction(
                UIAlertAction(title: "cancel",
                       style: UIAlertAction.Style.default,
                       handler: { Action in print("...")
           })
         )
         alertcontroller.addAction(
           UIAlertAction(title: "Delete",
                  style: UIAlertAction.Style.destructive,
                  handler: { Action in
             if editingStyle == .delete {
                 Firestore.firestore().collection("users").document(cell.id).delete()
             }
             self.tableview.reloadData()
           })
         )
         self.present(alertcontroller, animated: true, completion: nil)
       }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.rowHeight = 75
        tableview.delegate = self
        tableview.dataSource = self
        self.dataRead()
        view.backgroundColor = UIColor(named: "bgColor")

    }
//    Like button
    @objc func IlikeIt(sender: UIButton){
        print("button index = \(sender.tag)")
        sender.setImage(UIImage(systemName:"hand.thumbsup.fill"), for: .normal)
    }

//    Connect with firebase

    func dataRead(){
        Firestore.firestore().collection("users").addSnapshotListener { [self] snapshot, error in
            if error != nil {
                print(error)
                return
            }
            guard let documents = snapshot?.documents else { return }
            self.users = [User]()
            for document in documents {
                let data = document.data()
                let user = User(
                    id: (data["id"] as? String) ?? "" ,
                    name: (data["name"] as? String) ?? "" ,
                    comment: (data["comment"] as? String) ?? ""
                )
                self.users.append(user)
            }
            self.tableview.reloadData()
        }

    }
}

