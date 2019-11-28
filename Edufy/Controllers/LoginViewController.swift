//
//  LoginViewController.swift
//  Edufy
//
//  Created by Rani Singh on 2019-11-06.
//  Copyright © 2019 Rani Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var fb: UIButton!
   // @IBOutlet weak var login: UIButton!

    @IBOutlet weak var PasswordLabel: UITextField!
    @IBOutlet weak var EmailLabel: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.PasswordLabel.isSecureTextEntry = true
        let gifURL : String = "https://agentpekka.com/wp-content/uploads/2015/08/AP_Tim_Lahan_Laundry_640.gif"
                      let imageURL = UIImage.gifImageWithURL(gifURL)
                      let imageView3 = UIImageView(image: imageURL)
                      imageView3.frame = CGRect(x: 140.0, y: 130.0, width: self.view.frame.size.width-270, height: 120.0)
                      view.addSubview(imageView3)
    
    
        login.layer.cornerRadius = 5
        
        
        
    
    }
    

    @IBAction func forgot(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: self.EmailLabel.text!, completion: { (error) in
            
            var title = ""
            var message = ""
            
            if error != nil {
                title = "Error!"
                message = (error?.localizedDescription)!
            } else {
                title = "Success!"
                message = "Password reset email sent."
                self.EmailLabel.text = ""
            }
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
    

    
    @IBAction func Login(_ sender: UIButton) {
        
        let loginManager = FirebaseAuthManager()
               guard let email = EmailLabel.text,
                   let password = PasswordLabel.text
                   else { return }
               loginManager.signIn(email: email, pass: password) {[weak self] (success) in
                   guard let `self` = self else { return }
                   var message: String = ""
                   if (success) {
                       message = "User was sucessfully logged in."
                    
                    
                    
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
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
