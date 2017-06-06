//
//  SendSuggestionTableViewController.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/22.
//  Copyright © 2017年 mzc. All rights reserved.
//

import UIKit
import APNumberPad

class SendSuggestionTableViewController: UITableViewController,APNumberPadDelegate,UITextFieldDelegate
{
    var SelectdState = false
    
    @IBAction func funcBtnLockSelf(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }
    
    @IBAction func funcBtnBiekNoDismiss(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }
    
    @IBAction func funcBtnTyreBreak(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }
    
    @IBAction func funcBtnBikeLockBreak(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }
    
    @IBAction func funcBtnDisOrderParking(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }
    
    @IBAction func funcBtnPasswordWrong(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }
    
    @IBAction func funcBtnBrakeBreak(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }
    
    @IBAction func funcBtnOtherQuestion(_ sender: myPreviewButton)
    {
        sender.isSelected = !sender.isSelected
        funcSelectdState(selectBtn: sender)
    }

    // 提交按钮
    @IBAction func funcBtnSendSuggestion(_ sender: myPreviewButton)
    {
        funcBtnSend()
    }
    // 提交按钮事件
    func funcBtnSend()
    {
        // 待完善，往数据库添加一条保修信息（包含车牌号 故障问题 照片）
    }
    
    @IBOutlet weak var nameInputBikeNo: myPreviewTextField!
    
    @IBOutlet weak var nameInputComment: myPreviewTextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "吐槽"
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "popBack"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(SendSuggestionTableViewController.funcBack))
       
        //使用第三方键盘
        let numberPad = APNumberPad(delegate: self)
        numberPad.leftFunctionButton.setTitle("确定", for: UIControlState.normal)
        nameInputBikeNo.inputView = numberPad
        nameInputBikeNo.delegate = self

    
    }
    
    func numberPad(_ numberPad: APNumberPad, functionButtonAction functionButton: UIButton, textInput: UIResponder)
    {
        nameInputBikeNo.resignFirstResponder()
    }
    
    func funcBack()
    {
        dismiss(animated: true, completion: nil)
    }
    
    func funcSelectdState(selectBtn:myPreviewButton)
    {
        if selectBtn.isSelected
        {
            selectBtn.backgroundColor = UIColor.ofo
        }
        else
        {
            selectBtn.backgroundColor = UIColor.white
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
