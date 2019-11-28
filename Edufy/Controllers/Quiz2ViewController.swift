//
//  Quiz2ViewController.swift
//  Edufy
//
//  Created by Rani Singh on 2019-11-06.
//  Copyright © 2019 Rani Singh. All rights reserved.
//

import UIKit
import AVFoundation

class Quiz2ViewController: UIViewController {
    @IBOutlet weak var qno: UILabel!
    
    @IBOutlet weak var speaker: UIButton!
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var op1: UIButton!
    
    
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op3: UIButton!
    
    @IBOutlet weak var op4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    qno.layer.cornerRadius = 10
    qno.layer.borderWidth = 1
    qno.layer.borderColor = UIColor.gray.cgColor
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
    
    
    
    
    }
    
    @IBAction func speaker(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: question.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
    

}
