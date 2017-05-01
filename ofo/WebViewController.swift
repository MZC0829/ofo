//
//  WebViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/1.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController
{
    var webView:WKWebView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        webView = WKWebView(frame: self.view.frame)
        self.title = "热门活动"
        let url = URL(string: "http://m.ofo.so/")
        let request = URLRequest(url: url!)
        webView.load(request)
        self.view.addSubview(webView)
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
