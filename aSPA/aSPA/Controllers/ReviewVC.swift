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
    
    var users = [User]()
    
    @IBOutlet weak var tableview: UITableView!
    
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
 
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           
            
            let deleteAcion = UIContextualAction(
             style: .destructive,
             title: "Delete") { _, _, _ in
               
                 self.users.remove(at: indexPath.row)
               
                tableView.deleteRows(at: [indexPath],
                with: .automatic)
            }
            return UISwipeActionsConfiguration(actions:
                    [deleteAcion]
       ) }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.rowHeight = 75
        tableview.delegate = self
        tableview.dataSource = self
        self.dataRead()
        
      }
    @objc func IlikeIt(sender: UIButton){
        print("button index = \(sender.tag)")
        sender.setImage(UIImage(systemName:"hand.thumbsup.fill"), for: .normal)
    }
        
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
