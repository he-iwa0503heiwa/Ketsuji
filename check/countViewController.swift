//
//  countViewController.swift
//  check
//
//  Created by heiwa on 2016/09/02.
//  Copyright © 2016年 heiwa. All rights reserved.
//

import UIKit

class countViewController: UIViewController {
    @IBOutlet var kessekiLabel:UILabel!
    @IBOutlet var tikokuLabel:UILabel!
    @IBOutlet var kamokuLabel:UILabel!
    var kessekiNumber:Int = 0
    var tikokuNumber:Int = 0
    var saveData : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var ketujiDate : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var subjectNameArray:[AnyObject] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        kessekiNumber = ketujiDate.objectForKey("KESSEKI") as! Int
        tikokuNumber = ketujiDate.objectForKey("TIKOKU") as! Int
        
        kamokuLabel.text = String(kessekiNumber)
        kamokuLabel.text = String(tikokuNumber)


        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        subjectNameArray = saveData.arrayForKey("NAME")!
        print(subjectNameArray[0])
        kamokuLabel.text = subjectNameArray[0] as! String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func p(){
        kessekiNumber = kessekiNumber + 1
        kessekiLabel.text = String(kessekiNumber)
    }
    @IBAction func m(){
        kessekiNumber = kessekiNumber - 1
        kessekiLabel.text = String(kessekiNumber)
    }
    @IBAction func pl(){
        tikokuNumber = tikokuNumber + 1
        tikokuLabel.text = String(tikokuNumber)
    }
    @IBAction func ma(){
        tikokuNumber = tikokuNumber - 1
        tikokuLabel.text = String(tikokuNumber)
    }
    
    override func viewWillDisappear(animated: Bool) {
        ketujiDate.setObject(kessekiNumber, forKey: "KESSEKI")
        ketujiDate.setObject(tikokuNumber, forKey: "TIKOKU")
        ketujiDate.synchronize()
    }

    

    
}
