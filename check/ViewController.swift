//
//  ViewController.swift
//  check
//
//  Created by heiwa on 2016/06/24.
//  Copyright © 2016年 heiwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    private var myTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        // 表示する文字を代入する.
        myTextField.placeholder = "ここに教科を入力してください"
        // Delegateを設定する.
        myTextField.delegate = self
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        // UITextFieldの表示する位置を設定する.
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:100);
        // Viewに追加する.
        self.view.addSubview(myTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
