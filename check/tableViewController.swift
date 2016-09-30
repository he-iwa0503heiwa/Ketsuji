//
//  TableViewController.swift
//  check
//
//  Created by heiwa on 2016/07/30.
//  Copyright © 2016年 heiwa. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController ,UIGestureRecognizerDelegate{
    
    @IBOutlet var table : UITableView! = UITableView()
    var saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var items:[String] = []
    let cellID = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        NSLog("hog")
        
        
        // UILongPressGestureRecognizer宣言
        var longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "cellLongPressed:")
        
        // `UIGestureRecognizerDelegate`を設定するのをお忘れなく
        longPressRecognizer.delegate = self
        
        // tableViewにrecognizerを設定
        table.addGestureRecognizer(longPressRecognizer)
        
        
        
        
        //前回の保存内容があるかどうかを判定
        if((saveData.objectForKey("NAME")) != nil){
            
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects = saveData.objectForKey("NAME") as? NSArray
            
            //各名前を格納するための変数を宣言
            var nameString:AnyObject
            
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for nameString in objects!{
                //配列に追加していく
                items.append(nameString as! String)
            }
            
            
            
        }
        
        items.append("")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        table.reloadData()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // UILongPressGestureRecognizer宣言
        var longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "cellLongPressed:")
        
        // `UIGestureRecognizerDelegate`を設定するのをお忘れなく
        longPressRecognizer.delegate = self
        
        // tableViewにrecognizerを設定
        table.addGestureRecognizer(longPressRecognizer)
        
        table.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    // 長押しの時の動作
    func cellLongPressed(recognizer: UILongPressGestureRecognizer) {
        
        // 押された位置でcellのPathを取得
        let point = recognizer.locationInView(tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        
        if indexPath == nil {
            
        } else if recognizer.state == UIGestureRecognizerState.Began  {
            // 長押しされた場合の処理
            print("長押しされたcellのindexPath:\(indexPath?.row)")
            
            
            
            
            let alert: UIAlertController = UIAlertController(title: "科目入力", message: "科目を入力してください", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            alert.addTextFieldWithConfigurationHandler({(text:UITextField!) -> Void in })
            
            let cancelAction:UIAlertAction = UIAlertAction(title: "キャンセル",
                                                           style: .Cancel,
                                                           handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            print("キャンセル")
            })
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in let textFields:Array<UITextField>? = alert.textFields as Array<UITextField>?
                if textFields != nil {
                    for textFields:UITextField in textFields! {
                        
                        self.items[(indexPath?.row)!] = textFields.text!
                        
                        self.items.append("")
                        
                        
                        self.saveData.setObject(self.items, forKey: "NAME")
                        self.saveData.synchronize()
                        
                        
                        
                    }
                    NSLog("hoge")
                    
                }
                self.table.reloadData()
                
            }
            
            alert.addAction(defaultAction)
            alert.addAction(cancelAction)
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            items.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.saveData.setObject(self.items, forKey: "NAME")
            self.saveData.synchronize()
            
            self.table.reloadData()
            
            
            
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = String(items[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        
        // viewにロングタップのジェスチャーを追加
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "doGesture:")
        self.tableView.addGestureRecognizer(longPressGesture)
        
        if indexPath.row == items.count - 1 {
            
        }else {
            performSegueWithIdentifier("toInputView", sender: nil)
            
        }
        
        
        
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "科目入力"
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
