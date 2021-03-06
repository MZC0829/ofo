//
//  AppDelegate.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/1.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import AVOSCloud
import LeanCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        AMapServices.shared().apiKey = "f6d05a4ce4da25b5c42266899da289a7"
        AMapServices.shared().enableHTTPS = true
        
        AVOSCloud.setApplicationId("hBnK5M4fXXXYojkzfq8j4RjH-gzGzoHsz", clientKey: "soNIq8xJuOaVIImnSO55UWS7")
        //LeanCloud.initialize(applicationID: "hBnK5M4fXXXYojkzfq8j4RjH-gzGzoHsz", applicationKey: "soNIq8xJuOaVIImnSO55UWS7")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

