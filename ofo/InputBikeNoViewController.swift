//
//  InputBikeNoViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/18.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import APNumberPad

class InputBikeNoViewController: UIViewController,APNumberPadDelegate,UITextFieldDelegate
{
    var isFlashOn = false
    var isVoiceOn = true
    

    @IBOutlet weak var nameInputBikeNoTopView: UIView!
    @IBOutlet weak var nameInputPageImage: UIImageView!
    @IBOutlet weak var nameShowCostLabel: UILabel!
    @IBOutlet weak var nameInputBikeNoText: UITextField!
    @IBOutlet weak var nameGetPasswordButton: UIButton!
    @IBOutlet weak var nameVoiceBtn: UIButton!
    @IBOutlet weak var nameFlashBtn: UIButton!
    
    @IBAction func funcGetPasswordButton(_ sender: UIButton)
    {
        let vc = GetPasswordViewController()
        vc.bikeNo = nameInputBikeNoText.text!
    }
    //声音按钮状态切换
    @IBAction func funcVoiceBtn(_ sender: UIButton)
    {
        isVoiceOn = !isVoiceOn
        
        turnVoice(voiceButton: nameVoiceBtn)
        
        if isVoiceOn
        {
            nameVoiceBtn.setImage(#imageLiteral(resourceName: "voiceopen"), for: .normal)
        }
        else
        {
            nameVoiceBtn.setImage(#imageLiteral(resourceName: "voiceclose"), for: .normal)
        }
    }
    
    //闪光灯按钮状态切换
    @IBAction func funcFlashBtn(_ sender: UIButton)
    {
        isFlashOn = !isFlashOn
        
        if isFlashOn
        {
            nameFlashBtn.setImage(#imageLiteral(resourceName: "btn_enableTorch"), for: .normal)
        }
        else
        {
            nameFlashBtn.setImage(#imageLiteral(resourceName: "btn_unenableTorch"), for: .normal)
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameGetPasswordButton.isEnabled = false
        self.title = "车辆解锁"
        
        //使用第三方键盘
        let numberPad = APNumberPad(delegate: self)
        numberPad.leftFunctionButton.setTitle("确定", for: UIControlState.normal)
        nameInputBikeNoText.inputView = numberPad
        nameInputBikeNoText.delegate = self
        
        
        nameInputBikeNoText.layer.borderWidth = 2
        nameInputBikeNoText.layer.borderColor = UIColor.ofo.cgColor

        nameShowCostLabel.layer.cornerRadius = 5
        nameShowCostLabel.layer.masksToBounds = true
        
        nameInputBikeNoTopView.layer.shadowOffset = CGSize(width: 0, height: 0)
        nameInputBikeNoTopView.layer.shadowRadius = 3
        nameInputBikeNoTopView.layer.shadowOpacity = 0.5
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "扫码用车", style: .plain, target: self, action: #selector(funcBackToScan))
        
        
    }
    
    func funcBackToScan()
    {
        navigationController?.popViewController(animated: true)
    }
    
    func numberPad(_ numberPad: APNumberPad, functionButtonAction functionButton: UIButton, textInput: UIResponder)
    {
        print("你点击了键盘")
        if !nameInputBikeNoText.text!.isEmpty
        {
            performSegue(withIdentifier: "showPassword", sender: self)
        }
        
    }
    
    // 输入车牌号码
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        guard let text = textField.text else {
            return true
        }
        
        let newLength = text.characters.count + string.characters.count - range.length
        
        if newLength > 0
        {
            nameGetPasswordButton.setImage(#imageLiteral(resourceName: "nextArrow_enable"), for: .normal)
            nameGetPasswordButton.backgroundColor = UIColor.ofo
            
            nameGetPasswordButton.isEnabled = true
            
        }
        else
        {
            nameGetPasswordButton.setImage(#imageLiteral(resourceName: "nextArrow_unenable"), for: .normal)
            nameGetPasswordButton.backgroundColor = UIColor.groupTableViewBackground
            
            nameGetPasswordButton.isEnabled = false
        }
        
        return newLength <= 8
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
