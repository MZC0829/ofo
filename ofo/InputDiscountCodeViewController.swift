//
//  InputDiscountCodeViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/20.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import SWRevealViewController

class InputDiscountCodeViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = "输入优惠码"
        
        if revealViewController() != nil
        {
            
            navigationItem.leftBarButtonItem?.target = revealViewController()
            navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: #selector(InputDiscountCodeViewController.funcBackBtn))
    }
    
//    func funcBackBtn()
//    {
//        navigationController?.popViewController(animated: true)
//    }
//    

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
