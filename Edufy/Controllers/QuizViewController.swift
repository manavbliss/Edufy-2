//
//  QuizViewController.swift
//  Edufy
//
//  Created by Rani Singh on 2019-11-06.
//  Copyright © 2019 Rani Singh. All rights reserved.
//

import UIKit
import AVFoundation
import FirebaseDatabase

class QuizViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
  //  @IBOutlet weak var qno: UILabel!
    
    @IBOutlet weak var speaker: UIButton!
    @IBOutlet weak var op4: UIButton!
    @IBOutlet weak var op3: UIButton!
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op1: UIButton!
    
    @IBOutlet weak var Timertext: UIButton!
    
    var rightAnswer = 0;
    var wrongAnswer = 0;
    var  finalRight : UILabel!
    var finalWrong = "";
    
    
    
   
    
    var seconds = 30
    var timer = Timer()
       
      var  isTimerRunning = false
    
   
    var HighlightColor = UIColor(hexString: "#55BDA4")
    
    
    var items: [Quizdata] = []
      var newItems: [Quizdata] = []
    
    var countdownTimer: Timer!
    var totalTime = 20
    var MyAnswer = "";
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

      
      
        op1.layer.cornerRadius = 10
        op1.layer.borderWidth = 1
        op1.layer.borderColor = UIColor.gray.cgColor
        op2.layer.cornerRadius = 10
        op2.layer.borderWidth = 1
        op2.layer.borderColor = UIColor.gray.cgColor
        op3.layer.cornerRadius = 10
        op3.layer.borderWidth = 1
        op3.layer.borderColor = UIColor.gray.cgColor
        op4.layer.cornerRadius = 10
        op4.layer.borderWidth = 1
        op4.layer.borderColor = UIColor.gray.cgColor
        
        
       
        
      
        
       
        
        
        let ref = Database.database().reference(withPath: "Android")

              
        
      
             
             ref.observe(.value, with: { snapshot in
             // 2
            

             // 3
             for child in snapshot.children {
               // 4
               if let snapshot = child as? DataSnapshot,
                
                  let QuizItem = Quizdata(snapshot: snapshot) {
                self.newItems.append(QuizItem)
                //print(self.newItems[0].Question)
               }
             }

                
                self.Random()
             })
        
        

runTimer()
        
        
    }
    
    
    @IBAction func speaker(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: question.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
    
    func Random(){
        
                     op1.backgroundColor = UIColor.white;
                          op1.setTitleColor(UIColor.black, for: .normal)
                            op2.backgroundColor = UIColor.white;
                            op2.setTitleColor(UIColor.black, for: .normal)
                            op3.backgroundColor = UIColor.white;
                            op3.setTitleColor(UIColor.black, for: .normal)
                            op4.backgroundColor = UIColor.white;
                            op4.setTitleColor(UIColor.black, for: .normal)
        
        let  c = newItems.count;
   
        
        
        let randomvalue = Int.random(in: 1..<newItems.count);
            print(randomvalue)
        
      // let  randomvalue = 1;
        
        question.text = newItems[randomvalue].Question;
        
        op1.setTitle(newItems[randomvalue].Option1, for: .normal) ;
        op2.setTitle(newItems[randomvalue].Option2, for: .normal) ;
        op3.setTitle(newItems[randomvalue].Option3, for: .normal) ;
        op4.setTitle(newItems[randomvalue].Option4, for: .normal);
         
        MyAnswer = newItems[randomvalue].Answer
         print(MyAnswer)
        
         newItems.remove(at: randomvalue)
        
    }
    
    
    
    @IBAction func PreviousButton(_ sender: UIButton) {
        
        Random()
    }
    
    
    @IBAction func NextButton(_ sender: UIButton) {
       
        
        Random()
    }
    
    @IBAction func Option1Button(_ sender: UIButton) {
        //55BDA4
        
       
       
        if(op1.titleLabel?.text == MyAnswer){
            
            rightAnswer = rightAnswer+1;
      
      
            print("Right Answer")
            op1.backgroundColor = HighlightColor;
            op1.setTitleColor(UIColor.white, for: .normal)
            
        }
        else{
            op1.backgroundColor = UIColor.red;
            op1.setTitleColor(UIColor.white, for: .normal)
            
            print("Wrong Answer")
                 wrongAnswer = wrongAnswer+1;
        }
        
        
       let delayTime = DispatchTime.now() + 1.0
       print("one")
       DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
        self.reset()
       })
               
               
        
       
        
        
        
    
    
        
    }
    @IBAction func Option2Button(_ sender: Any) {
        
        
        if(op2.titleLabel?.text == MyAnswer){
             op2.backgroundColor = HighlightColor;
             op2.setTitleColor(UIColor.white, for: .normal)
                 print("RIght ANswer")
             rightAnswer = rightAnswer+1;
             }
             else{
             op2.backgroundColor = UIColor.red;
             op2.setTitleColor(UIColor.white, for: .normal)
                 print("Wrong ANswer")
                 wrongAnswer = wrongAnswer+1;
             }
             
            let delayTime = DispatchTime.now() + 1.0
                   print("one")
                   DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                    self.reset()
                   })
        
    
    }
    
    @IBAction func Option3Button(_ sender: UIButton) {
        
        if(op3.titleLabel?.text == MyAnswer){
             op3.backgroundColor = HighlightColor;
             op3.setTitleColor(UIColor.white, for: .normal)
                 print("RIght ANswer")
             rightAnswer = rightAnswer+1;
             }
             else{
             op3.backgroundColor = UIColor.red;
             op3.setTitleColor(UIColor.white, for: .normal)
                 print("Wrong ANswer")
                 wrongAnswer = wrongAnswer+1;
             }
             
             let delayTime = DispatchTime.now() + 1.0
                   print("one")
                   DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                    self.reset()
                   })
        
        
    }
    
    @IBAction func Option4Button(_ sender: Any) {
        
        if(op4.titleLabel?.text == MyAnswer){
             op4.backgroundColor = HighlightColor;
             op4.setTitleColor(UIColor.white, for: .normal)
                 print("RIght ANswer")
             rightAnswer = rightAnswer+1;
             }
             else{
             op4.backgroundColor = UIColor.red;
             op4.setTitleColor(UIColor.white, for: .normal)
                 print("Wrong ANswer")
            wrongAnswer = wrongAnswer+1;
             }
             
             let delayTime = DispatchTime.now() + 1.0
                   print("one")
                   DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                   self.reset()
                   })
        
    }
    @IBAction func Submit(_ sender: Any) {
        
        
       

        
              
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue!, sender: Any?) {
//          
//                var QuizCont = segue.destination as! ResultViewController
//               QuizCont.finalR = self.finalRight
//               QuizCont.finalW = self.finalWrong
//    
//    }
    
   
   
    
    func reset(){
      Random()
          }
    
    func runTimer()
       {
        
       // timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: updateTimer(), userInfo: nil, repeats: true)
      //Qui  timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (selector(QuizViewController.updateTimer)), userInfo: nil, repeats: true)
       timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(QuizViewController.updateTimer)), userInfo: nil, repeats: true)
       }
      
      @objc
    
    func updateTimer() {
        
        if(seconds>0){
          seconds -= 1
        
        let str1 = "\(seconds)"
        
        Timertext.setTitle(str1, for: .normal)
        
        print(str1)
     
      if(seconds <= 0 ){
            Timertext.setTitle("0", for: .normal)
         print(str1)
      }
      if(seconds == 1){
               
     
          
          let alert = UIAlertController(title:"Time Over", message: "Check Your Score", preferredStyle: .alert)
        
          let action = UIAlertAction(title: "Submit", style: .default, handler: { _ in
            
            
              self.send()
            
            
            
            
          })
        
            
          alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
      
            
            
        }
        }
        //self.performSegue(withIdentifier: "Result", sender: self)
        
        print("right result = \(rightAnswer)")
        print("wrong result = \(wrongAnswer)")
        //let finalResult1 =  rightAnswer
       // let finalResult2 = wrongAnswer
        
     //
       // vc.finalW = finalResult2
        
        
        
        
      
    }
    func send(){
        
        //self.finalRight.text = String(rightAnswer)
       let vc = ResultViewController()
       vc.finalR = String(rightAnswer)
        //print (" ooo result = \(finalRight!)")
        
        performSegue(withIdentifier: "Result", sender: nil)
        //let finalResult1 =  self.rightAnswer
        
       
        
       
        
    }
  

}
    
    
    

    

    extension UIColor {
        convenience init(hexString: String) {
            let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int = UInt64()
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
            
                   
        }
       
        
        
}
      
        
    

