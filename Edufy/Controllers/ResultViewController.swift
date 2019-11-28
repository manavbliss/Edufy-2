//
//  ResultViewController.swift
//  Edufy
//
//  Created by Rani Singh on 2019-11-07.
//  Copyright © 2019 Rani Singh. All rights reserved.
//

import UIKit
import Charts
import FBSDKCoreKit
import FBSDKShareKit
import FirebaseAuth
import FirebaseDatabase
import AVFoundation


class ResultViewController: UIViewController {
    
    var finalR : String?
    var finalW : Int?
    var myPic: UIImage?
    let qz = QuizViewController()
    //public var user :String?
    
       // @IBOutlet weak var User: UILabel!
   
    
    @IBOutlet weak var PieView: PieChartView!
    
    @IBOutlet weak var share: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(finalR ?? "Value not recieved")
        


     
        setupPieChart()
    }
    
    @IBAction func printresult(_ sender: Any) {
        print(finalR!)
        
    }
    //
    
    func setupPieChart(){
           PieView.chartDescription?.enabled = false
           PieView.drawHoleEnabled = false
           PieView.rotationAngle = 0
           PieView.rotationEnabled = false
           PieView.isUserInteractionEnabled = false
           
           var entries:[PieChartDataEntry] = Array()
           entries.append(PieChartDataEntry(value: 30.0, label: "Wrong"))
           entries.append(PieChartDataEntry(value: 70.0, label: "Right"))
           let dataset = PieChartDataSet(entries: entries, label: "Score" )
            let c1 = NSUIColor(hex: 0xf8655d)
           let c2 = NSUIColor(hex: 0x8c2393)
           dataset.colors = [c1,c2]
           dataset.drawValuesEnabled = false
           
           PieView.data = PieChartData(dataSet: dataset)
       }
    fileprivate func captureUIImageFromUIView(_ view:PieChartView?) -> UIImage {

         guard (view != nil) else{

            // if the view is nil (it's happened to me) return an alternative image
            let errorImage = UIImage(named: "Error Image")!
            return errorImage
         }

         // if the view is all good then convert the image inside the view to a uiimage
         if #available(iOS 10.0, *) {

             let renderer = UIGraphicsImageRenderer(size: view!.bounds.size)
             let capturedImage = renderer.image {
                 (ctx) in
                 view!.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
             }
             return capturedImage

         } else {

             UIGraphicsBeginImageContextWithOptions((view!.bounds.size), view!.isOpaque, 0.0)
             view!.drawHierarchy(in: view!.bounds, afterScreenUpdates: false)
             let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
             UIGraphicsEndImageContext()
             return capturedImage!
         }
    }
    

    @IBAction func share(_ sender: Any) {
       let shareImage = SharePhoto()
        myPic = captureUIImageFromUIView(PieView)
        shareImage.image = myPic!//Image from your imageview
        shareImage.isUserGenerated = true

        let content = SharePhotoContent()
        content.photos = [shareImage]

        let sharedDialoge = ShareDialog()
        sharedDialoge.shareContent = content

        sharedDialoge.fromViewController = self
        sharedDialoge.mode = .automatic


        if(sharedDialoge.canShow)
        {
          sharedDialoge.show()
        }
        else
        {
          print("Install Facebook client app to share image")
        }
    }
    
}
