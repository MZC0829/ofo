//
//  ViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/1.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController
{

    @IBOutlet weak var nameMKMapView: MKMapView!
    
    //var screenWidth:CGFloat!
    //var screenHight:CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //主页面 ofo LOGO
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        //左边菜单按钮
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //右边菜单按钮
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        
        //深圳经纬度 22.5428600000,114.0595600000
        let center = CLLocationCoordinate2D(latitude: 22.5428600000, longitude: 114.0595600000)
        //范围
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        nameMKMapView.region = MKCoordinateRegion(center: center, span: span)
        
        //nameMKMapView.showsUserLocation = true
        //nameMKMapView.isUserLocationVisible = true
        
        print(nameMKMapView.userLocation)
        
        //添加大头针
        let annotation:MyAnnotation = MyAnnotation(coordinate: center)
        nameMKMapView.addAnnotation(annotation)
        
        
        let mkAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "anno")
        
        mkAnnotationView.image = #imageLiteral(resourceName: "HomePage_nearbyBike")
        mkAnnotationView.annotation = annotation
        mkAnnotationView.centerOffset = CGPoint(x: 10, y: 10)
        nameMKMapView.addSubview(mkAnnotationView)
        
        
        let nearBikeImageView:UIImageView = UIImageView(image: #imageLiteral(resourceName: "HomePage_nearbyBike"))
        nearBikeImageView.frame = CGRect(x: 50, y: 50, width: 30, height: 30)
        nameMKMapView.addSubview(nearBikeImageView)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

