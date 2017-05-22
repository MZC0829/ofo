//
//  UIViewHelper.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/20.
//  Copyright © 2017年 mzc. All rights reserved.
//

// MARK: - 扩展UIView
extension UIView {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
             self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0 
        }
    }
}
// MARK: - 使UILabel所见即所得
@IBDesignable class myPreviewLabel:UILabel {
    
}

// MARK: - 使UITextField所见即所得
@IBDesignable class myPreviewTextField:UITextField {
    
}

// MARK: - 使UIButton所见即所得
@IBDesignable class myPreviewButton:UIButton {
    
}



import AVFoundation
// MARK: - 控制手电筒开关
func turnTorch()  {
    guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else {
        return
    }
    
    if device.hasTorch && device.isTorchAvailable {
        try? device.lockForConfiguration()
        
        if device.torchMode == .off {
            device.torchMode = .on
        } else {
            device.torchMode = .off
        }
        
        
        device.unlockForConfiguration()
    }
}

// MARK: - 控制声音开关
func turnVoice(voiceButton:UIButton)
{
//    var isVoiceOn = true
//    isVoiceOn = !isVoiceOn
    
    let defaults = UserDefaults.standard
    
    if defaults.string(forKey: "isVoiceOn") == nil
    {
        defaults.setValue(Bool(), forKey: "isVoiceOn")
    }
    
    if defaults.bool(forKey: "isVoiceOn")
    {
        voiceButton.setImage(#imageLiteral(resourceName: "voiceopen"), for: .normal)
    }
    else
    {
        voiceButton.setImage(#imageLiteral(resourceName: "voiceclose"), for: .normal)
    }
    
}












