//
//  BikeNoErrorViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/25.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import MIBlurPopup

class BikeNoErrorViewController: UIViewController {

    @IBOutlet weak var nameMyPopupView: UIView!
    
    
    @IBAction func funcOkBtn(_ sender: Any)
    {
        close()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func close()
    {
        dismiss(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        close()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    }

extension BikeNoErrorViewController: MIBlurPopupDelegate {
    
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


