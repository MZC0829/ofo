//
//  GetPasswordViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/19.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import SwiftyTimer
import SwiftySound

class GetPasswordViewController: UIViewController {
    
    @IBOutlet weak var nameBikePassword1: myPreviewLabel!
    @IBOutlet weak var nameBikePassword2: myPreviewLabel!
    @IBOutlet weak var nameBikePassword3: myPreviewLabel!
    @IBOutlet weak var nameBikePassword4: myPreviewLabel!
    
    var isTorchOn = false
    var isVoiceOn = true
    var CountdownSeconds = 121
    var bikeNo:String = ""
    var bikePasswordArray : [String] = [] {
            didSet{
                self.nameBikePassword1.text = bikePasswordArray[0]
                self.nameBikePassword2.text = bikePasswordArray[1]
                self.nameBikePassword3.text = bikePasswordArray[2]
                self.nameBikePassword4.text = bikePasswordArray[3]
            }
    }
    
    @IBOutlet weak var nameLabelTimer: UILabel!
    @IBOutlet weak var nameTorchBtn: UIButton!
    @IBOutlet weak var nameVoiceBtn: UIButton!
    @IBOutlet weak var nameLabelBikeNo: UILabel!
    
    //立即报修事件
    @IBAction func funcBtnSendRepairs(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    //打开或者关闭手电筒
    @IBAction func funcTorchBtn(_ sender: UIButton)
    {
        isTorchOn = !isTorchOn
        
        if isTorchOn
        {
            nameTorchBtn.setImage(#imageLiteral(resourceName: "btn_enableTorch"), for: UIControlState.normal)
        }
        else
        {
            nameTorchBtn.setImage(#imageLiteral(resourceName: "btn_unenableTorch"), for: UIControlState.normal)
        }
    }
    
    //打开或者关闭声音
    @IBAction func funcVoiceBtn(_ sender: UIButton)
    {
        turnVoice(voiceButton: nameVoiceBtn)
        isVoiceOn = !isVoiceOn
        if isVoiceOn
        {
            nameVoiceBtn.setImage(#imageLiteral(resourceName: "voiceopen"), for: UIControlState.normal)
        }
        else
        {
            nameVoiceBtn.setImage(#imageLiteral(resourceName: "voiceclose"), for: UIControlState.normal)
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 播放上车前的语音
        Sound.play(file: "上车前.m4a")
        
        nameLabelBikeNo.text = "车牌号\(bikeNo)的解锁码"
        
        // 120秒倒计时开始
        Timer.every(1) { (timer:Timer) in
            self.CountdownSeconds -= 1
            if self.CountdownSeconds == 0
            {
                timer.invalidate()
            }
            self.nameLabelTimer.text = self.CountdownSeconds.description
        }
        //navigationController?.navigationBar.barStyle = .blackOpaque
        //navigationController?.navigationBar.backgroundColor
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(GetPasswordViewController.funcBack))
        
        
    }
    
//    func funcBack()
//    {
//        dismiss(animated: true, completion: nil)
//    }

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
