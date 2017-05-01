//
//  ViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/1.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var nameMKMapView: MKMapView!
    //var screenWidth:CGFloat!
    //var screenHight:CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
//        screenWidth = view.bounds.width
//        screenHight = view.bounds.height
//        nameMKMapView = MKMapView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHight))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

