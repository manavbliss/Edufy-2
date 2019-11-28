//
//  CreateViewController.swift
//  Edufy
//
//  Created by Rani Singh on 2019-11-06.
//  Copyright © 2019 Rani Singh. All rights reserved.
//

import UIKit
import  FirebaseAuth
 


class CreateViewController: UIViewController {
    @IBOutlet weak var NameLabel: UITextField!
    
    @IBOutlet weak var EmailLabel: UITextField!
    @IBOutlet weak var PasswordLabel: UITextField!
    
   
    
    @IBOutlet weak var createbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
         self.PasswordLabel.isSecureTextEntry = true
        // Do any additional setup after loading the view.
        let gifURL : String = "https://agentpekka.com/wp-content/uploads/2015/08/AP_Tim_Lahan_Laundry_640.gif"
                          let imageURL = UIImage.gifImageWithURL(gifURL)
                          let imageView3 = UIImageView(image: imageURL)
                          imageView3.frame = CGRect(x: 140.0, y: 130.0, width: self.view.frame.size.width-270, height: 120.0)
                          view.addSubview(imageView3)
        
        
            createbutton.layer.cornerRadius = 5
        
        
        
            
        
    }
    
  
    @IBAction func SIgnUp(_ sender: Any) {
        
        let signUpManager = FirebaseAuthManager()
               if let email = EmailLabel.text,
                   let password = PasswordLabel.text,
                 let name = NameLabel.text {
                   signUpManager.createUser(email: email, password: password , name: name) {[weak self] (success) in
                       guard let `self` = self else { return }
                       var message: String = ""
                       if (success) {
                           message = "User was sucessfully created."
                        
                          self.performSegue(withIdentifier: "category", sender: self)
                        
                       } else {
                           message = "There was an error."
                        let alert = UIAlertController(title: "Edufy", message: message, preferredStyle: UIAlertController.Style.alert)

                                                     // add an action (button)
                                                     alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                                     // show the alert
                                                     self.present(alert, animated: true, completion: nil)
                       }
                      
                   }
                   
               }
    }
    
//   func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
//       Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
//           if let user = authResult?.user {
//               print(user)
//               completionBlock(true)
//           } else {
//               completionBlock(false)
//           }
//       }
   }



