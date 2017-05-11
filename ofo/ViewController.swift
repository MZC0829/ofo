//
//  ViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/1.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MAMapViewDelegate
{

    var mapView:MAMapView! //高德地图全局变量
    
    @IBOutlet weak var nameUIViewHomePageBottom: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //初始化高德地图
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.isZoomEnabled = true
        mapView.isRotateEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.zoomLevel = 17
        self.view.addSubview(mapView)
        
        //加载主页面的底部面部，在前面显示
        self.view.bringSubview(toFront: nameUIViewHomePageBottom)
        
        
        //主页面 ofo LOGO
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        //左边菜单按钮
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //右边菜单按钮
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        
        
        
        let center = CLLocationCoordinate2D(latitude: 22.5545720, longitude: 113.9653770)
        //范围
        let span = MACoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        mapView.region = MACoordinateRegion(center: center, span: span)
        
//        //
//        print(nameMKMapView.userLocation)
//        
//        //添加大头针
//        let annotation:MyAnnotation = MyAnnotation(coordinate: center)
//        nameMKMapView.addAnnotation(annotation)
//        
//        
//        let mkAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "anno")
//        
//        mkAnnotationView.image = #imageLiteral(resourceName: "HomePage_nearbyBike")
//        mkAnnotationView.annotation = annotation
//        mkAnnotationView.centerOffset = CGPoint(x: 10, y: 10)
//        nameMKMapView.addSubview(mkAnnotationView)
//        
//        
//        let nearBikeImageView:UIImageView = UIImageView(image: #imageLiteral(resourceName: "HomePage_nearbyBike"))
//        nearBikeImageView.frame = CGRect(x: 50, y: 50, width: 30, height: 30)
//        nameMKMapView.addSubview(nearBikeImageView)
//        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

