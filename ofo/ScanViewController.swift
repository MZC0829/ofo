//
//  ScanViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/16.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import swiftScan

class ScanViewController: LBXScanViewController {
    
    var isFlashOn = false
    
    @IBOutlet weak var panelView: UIView!

    @IBOutlet weak var nameBtnFlash: UIButton!
    
    @IBAction func funcBtnFlash(_ sender: UIButton)
    {
        isFlashOn = !isFlashOn
        
        //闪光灯打开或关闭
        scanObj?.changeTorch()
        
        if isFlashOn
        {
            nameBtnFlash.setImage(#imageLiteral(resourceName: "btn_enableTorch_w"), for: .normal)
        }
        else
        {
            nameBtnFlash.setImage(#imageLiteral(resourceName: "btn_unenableTorch_w"), for: .normal)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = "扫码用车"
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationItem.backBarButtonItem?.title = ""
        
        //扫描二维码样式
        var style = LBXScanViewStyle()
        //style.anmiationStyle = .LineMove
        //style.animationImage = #imageLiteral(resourceName: "qrcode_Scan_weixin_Line")
        style.anmiationStyle = .NetGrid
        //style.animationImage = #imageLiteral(resourceName: "qrcode_scan_part_net")
        style.animationImage = #imageLiteral(resourceName: "bg_QRCodeLine")
        scanStyle = style
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        view.bringSubview(toFront: panelView)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = UIColor.black
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func didReceiveMemoryWarning() {
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
