//
//  ThanksSendSuggestionViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/26.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit

class ThanksSendSuggestionViewController: UIViewController {

    @IBAction func funcBarBtnBack(_ sender: UIBarButtonItem) {
        funcBack()
    }
    
    @IBAction func funcBackBtn(_ sender: UIButton)
    {
        funcBack()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func funcBack()
    {
        dismiss(animated: true, completion: nil)
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
