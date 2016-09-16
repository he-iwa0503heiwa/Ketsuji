//
//  countViewController.swift
//  check
//
//  Created by heiwa on 2016/09/02.
//  Copyright © 2016年 heiwa. All rights reserved.
//

import UIKit

class countViewController: UIViewController {
    @IBOutlet var label:UILabel!
    @IBOutlet var label1:UILabel!
    var kessekinumber:Int = 0
    var tikokunumber:Int = 0
    var saveData : NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func p(){
        kessekinumber = kessekinumber + 1
        label.text = String(kessekinumber)
    }
    @IBAction func m(){
        kessekinumber = kessekinumber - 1
        label.text = String(kessekinumber)
    }
    @IBAction func pl(){
        tikokunumber = tikokunumber + 1
        label1.text = String(tikokunumber)
    }
    @IBAction func ma(){
        tikokunumber = tikokunumber - 1
        label1.text = String(tikokunumber)
    }
    @IBAction func saveMemo() {
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
