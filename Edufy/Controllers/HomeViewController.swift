//
//  HomeViewController.swift
//  Edufy
//
//  Created by Rani Singh on 2019-11-06.
//  Copyright © 2019 Rani Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var hard: UIButton!
    
    @IBOutlet weak var intermediate: UIButton!
    @IBOutlet weak var beginner: UIButton!
    
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        view1.layer.cornerRadius = 8
        beginner.layer.cornerRadius = 8
        intermediate.layer.cornerRadius = 8
        hard.layer.cornerRadius = 8
        
           
            
    }
    

   

}
