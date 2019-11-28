//
//  ViewController.swift
//  Edufy
//
//  Created by Rani Singh on 2019-11-06.
//  Copyright © 2019 Rani Singh. All rights reserved.
//

import UIKit

import  FirebaseDatabase
import FirebaseAuth


class ViewController: UIViewController{
    

    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var create: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gifURL : String = "https://agentpekka.com/wp-content/uploads/2015/08/AP_Tim_Lahan_Laundry_640.gif"
                let imageURL = UIImage.gifImageWithURL(gifURL)
                let imageView3 = UIImageView(image: imageURL)
                imageView3.frame = CGRect(x: 40.0, y: 100.0, width: self.view.frame.size.width-80, height: 300.0)
                view.addSubview(imageView3)
        
         login.layer.cornerRadius = 5
         create.layer.cornerRadius = 5
         
        
    
}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
        }
    }

}


