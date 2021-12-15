//
//  FirstInterfaceVC.swift
//  aSPA
//
//  Created by dmdm on 13/12/2021.
//

import UIKit



class HomeVC: UIViewController{
    
//   gesture recognizer for background color
    
    
    @IBOutlet weak var locationNameLable: UILabel!
    
    @IBOutlet weak var ChooseServicesbtn: UIButton!
    
    @IBOutlet weak var locationBtn: UIButton!

    
    
//    Image View
    lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "newphoto")
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 30
            return imageView
          }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        
        
//        constraints
        view.addSubview(imageView)
                NSLayoutConstraint.activate([ imageView.topAnchor.constraint(equalTo: view.topAnchor, constant:50),
                imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
                imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                imageView.widthAnchor.constraint(equalToConstant: 300),
              
                ])
    //Localizable
        locationNameLable.text = NSLocalizedString("A Spa King Fahd Road", comment: "")
        ChooseServicesbtn.setTitle(NSLocalizedString("Choose Serviecs", comment: ""), for: .normal)

        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(background)
        )
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
        view.isUserInteractionEnabled = true
    }
        
        
@objc func background() {
   
    view.backgroundColor = UIColor (named: "background")
}

}
