//
//  ShowDevelopingViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/26.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import MIBlurPopup

class ShowDevelopingViewController: UIViewController {

    @IBOutlet weak var nameMyPopupView: UIView!
    
    @IBAction func funcOkBtn(_ sender: Any)
    {
        close()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        close()
    }
    
    func close()
    {
        dismiss(animated: true)
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

extension ShowDevelopingViewController: MIBlurPopupDelegate {
    
    var popupView: UIView {
        return nameMyPopupView
    }
    
    var blurEffectStyle: UIBlurEffectStyle {
        return .dark
    }
    
    var initialScaleAmmount: CGFloat {
        return 0.2
    }
    
    var animationDuration: TimeInterval {
        return 0.2
    }
}

