import UIKit
import FirebaseAuth
import FirebaseDatabase



class FirebaseAuthManager {
    
    
   
    func createUser(email: String, password: String,name: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
             
                let ref =   Database.database().reference().root
                
                ref.child("Users").child((authResult?.user.uid)!).setValue(["username": name])
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
                
                
                //
                
               
                
                
               
            }
        }
}
}

