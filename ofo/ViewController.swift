//
//  ViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/1.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import MapKit
import SWRevealViewController
import FTIndicator

class ViewController: UIViewController,MAMapViewDelegate,AMapSearchDelegate,AMapNaviWalkManagerDelegate
{
    var mapView:MAMapView! //定义高德地图全局变量
    var search:AMapSearchAPI! //定义搜索全局变量
    var userCurrentLocation:CLLocationCoordinate2D!//用户当前位置
    var userLocationAnnotation:MyPinAnnotation!  //用户位置加个大头针
    var pinView:MAAnnotationView!  //用户移动的大头针
    var start,end:CLLocationCoordinate2D! //找车的起点和终点
    var walkManager:AMapNaviWalkManager!  //步行找车

    
    @IBOutlet weak var nameUIViewHomePageBottom: UIView!
    
    @IBAction func funcSearchNearByBike(_ sender: UIButton)
    {
        
        let pinStartLocation = userCurrentLocation!
        //mapView.centerCoordinate = mapView.centerCoordinate
        
        UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            self.mapView.centerCoordinate = pinStartLocation
        }, completion: nil)
        
        

        searchNearbyBike()
        
    }
    
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
        
        //初始化搜索
        search = AMapSearchAPI()
        search.delegate = self
        
        //步行找车初始化
        walkManager = AMapNaviWalkManager()
        walkManager.delegate = self
        
        //主页面 ofo LOGO
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ofoLogo"))
        //左边菜单按钮
        self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "leftTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //右边菜单按钮
        self.navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "rightTopImage").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //点击按钮，弹出侧边栏
        if self.revealViewController() != nil
        {
            self.revealViewController().rearViewRevealWidth = 280
            navigationItem.leftBarButtonItem?.target = revealViewController()
            navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 用户移动大头针的动画
    
    func pinAnimation()
    {
        let endFrame = pinView.frame
        pinView.frame = endFrame.offsetBy(dx: 0, dy: -15)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: { 
            self.pinView.frame = endFrame
        }, completion: nil)
    }
    
    // MARK: - mapView Delegate
    
    //mapView地图初始化完成后
    func mapInitComplete(_ mapView: MAMapView!)
    {
        //初始化
        //userCurrentLocation = CLLocationCoordinate2D()
        userCurrentLocation = CLLocationCoordinate2D(latitude: 22.560127 , longitude: 113.974397)
        //获取用户当前位置
        userCurrentLocation = mapView.userLocation.coordinate
        //范围
        let span = MACoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        mapView.region = MACoordinateRegion(center: userCurrentLocation, span: span)
        
        
        userLocationAnnotation = MyPinAnnotation()
        userLocationAnnotation.coordinate = mapView.centerCoordinate
        
        userLocationAnnotation.lockedScreenPoint = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
        userLocationAnnotation.isLockedToScreen = true
        
        mapView.addAnnotation(userLocationAnnotation)
        mapView.showAnnotations([userLocationAnnotation], animated: true)
        
        searchNearbyBike()
    }
    
    
    /// 点击所选的小黄车大头针方法
    ///
    /// - Parameters:
    ///   - mapView: mapView
    ///   - view: 选中的大头针
    func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!)
    {
        start = userLocationAnnotation.coordinate
        end = view.annotation.coordinate
        
        let startPoint = AMapNaviPoint.location(withLatitude: CGFloat(start.latitude), longitude: CGFloat(start.longitude))!
        let endPoint = AMapNaviPoint.location(withLatitude: CGFloat(end.latitude), longitude: CGFloat(end.longitude))!
        
        walkManager.calculateWalkRoute(withStart: [startPoint], end: [endPoint])
    }
    
    
    /// 自定义大头针视图
    ///
    /// - Parameters:
    ///   - mapView: mapView
    ///   - annotation: 标注
    /// - Returns: 大头针视图
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView!
    {
        //用户位置，不需要自定义
        if annotation is MAUserLocation
        {
            return nil
        }
        if annotation is MyPinAnnotation
        {
            let reuseId = "anchor"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MAPinAnnotationView
            
            if annotationView == nil
            {
                annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            }
            annotationView?.image = #imageLiteral(resourceName: "homePage_wholeAnchor")
            annotationView?.canShowCallout = true

            pinView = annotationView
            return annotationView
        }
        
        
        let reuseId = "myid"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MAPinAnnotationView
        
        if annotationView == nil
        {
            annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        
        if annotation.title == "正常可用"
        {
            annotationView?.image = #imageLiteral(resourceName: "HomePage_nearbyBike")
        }
        else
        {
            annotationView?.image = #imageLiteral(resourceName: "HomePage_nearbyBikeRedPacket")
        }
        
        annotationView?.animatesDrop = true
        annotationView?.canShowCallout = true
        
        return annotationView
        
    }
    
    // 画出步行找车线路
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer!
    {
        if overlay is MAPolyline
        {
            userLocationAnnotation.isLockedToScreen = false
            //只显示当前的线路
            mapView.visibleMapRect = overlay.boundingMapRect
            
            let renderer = MAPolylineRenderer(overlay: overlay)
            renderer?.lineWidth = 6.0
            renderer?.strokeColor = UIColor.blue
            return renderer
        }
        
        return nil
        
    }
    
    /// 用户移动地图的交互
    ///
    /// - Parameters:
    ///   - mapView: mapView
    ///   - wasUserAction: 用户是否移动地图
    func mapView(_ mapView: MAMapView!, mapDidMoveByUser wasUserAction: Bool) {
        if wasUserAction
        {
            pinAnimation()
            searchCustomLocation(mapView.centerCoordinate)
        }
    }
    
    
    // MARK: - Map Search Delegate
    
    //搜索周边的小黄车请求
    func searchNearbyBike()
    {
        searchCustomLocation(mapView.userLocation.coordinate)
    }
    
    
    /// 根据参数的坐标搜索附近的小黄车（现在使用 餐馆 代替）
    ///
    /// - Parameter center: 地图坐标
    func searchCustomLocation(_ center:CLLocationCoordinate2D)
    {
        let request = AMapPOIAroundSearchRequest()
        request.location = AMapGeoPoint.location(withLatitude: CGFloat(center.latitude), longitude: CGFloat(center.longitude))
        request.keywords = "餐馆"
        request.requireExtension = true
        request.radius = 500
        
        search.aMapPOIAroundSearch(request)
    }
    
    //搜索周边完成后的处理
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        guard response.count > 0 else {
            print("周边没有小黄车")
            return
        }
        
        var annotations:[MAPointAnnotation] = []
        
        annotations = response.pois.map{
            
            let annotation = MAPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees($0.location.latitude), longitude: CLLocationDegrees($0.location.longitude))
            
            if $0.distance < 200
            {
                annotation.title = "红包单车"
                annotation.subtitle = "骑行半小时即可获得一个红包"
            }
            else
            {
                annotation.title = "正常可用"
            }
            
            return annotation
        }
        
        mapView.addAnnotations(annotations)
        //mapView.showAnnotations(annotations, animated: true)
        
    }
    
    // MARK: - AMapNaviWalkManagerDelegate 步行找车代理
    func walkManager(onCalculateRouteSuccess walkManager: AMapNaviWalkManager)
    {
        print("找车成功")
        mapView.removeOverlays(mapView.overlays) //去除之前的线路
        
        var coordinates = walkManager.naviRoute!.routeCoordinates!.map
            {            return CLLocationCoordinate2D(latitude: CLLocationDegrees($0.latitude), longitude: CLLocationDegrees($0.longitude))
            }
    
        let polyline = MAPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
        
        mapView.add(polyline)
        
        //提示步行用时和时间
        let walkMinute = walkManager.naviRoute!.routeTime / 60
        
        var timeDesc = "1分钟以内"
        if walkMinute > 0
        {
            timeDesc = walkMinute.description + "分钟"
        }
        
        let showTitle =  "步行" + timeDesc
        let showSubtitle = "距离" + walkManager.naviRoute!.routeLength.description + "米"
        
        FTIndicator.setIndicatorStyle(UIBlurEffectStyle.dark)
        FTIndicator.showNotification(with: #imageLiteral(resourceName: "clock"), title: showTitle, message: showSubtitle)
        
    }
}

