
import Foundation
import Firebase

struct Quizdata {
  
    let ref: DatabaseReference?
    let key: String
    let Answer: String
    let Option1: String
       let Option2: String
       let Option3: String
       let Option4: String
     let Question: String
   
    
    init(Answer: String, Option1: String, Option2: String, Option3: String,Option4: String, Question: String, key: String = "") {
      self.ref = nil
      self.key = key
      self.Answer = Answer
      self.Option1 = Option1
      self.Option2 = Option3
       self.Option3 = Option3
       self.Option4 = Option4
    self.Question = Question
       
    
    }
    
    init?(snapshot: DataSnapshot) {
      guard
        let value = snapshot.value as? [String: AnyObject],
        let Answer = value["Answer"] as? String,
        let Option1 = value["Option1"] as? String,
        let Option2 = value["Option2"] as? String,
        let Option3 = value["Option3"] as? String,
        let Option4 = value["Option4"] as? String,
        let Question = value["Question"] as? String
        else{
            return nil
        }
       
        self.ref = snapshot.ref
      self.key = snapshot.key
      self.Answer = Answer
      self.Option1 = Option1
      self.Option2 = Option2
      self.Option3 = Option3
      self.Option4 = Option4
      self.Question = Question
      

    }
    
    func toAnyObject() -> Any {
        
      return[
        "Answer": Answer,
        "Option1": Option1,
        "Option2": Option2,
        "Option3": Option3,
               "Option4": Option4,
               "Question": Question
      ]
    }
  
}
