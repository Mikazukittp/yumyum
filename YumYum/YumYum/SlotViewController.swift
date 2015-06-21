//
//  SlotViewController.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/19.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class SlotViewController: UIViewController {

    
    var countNum = 0
    var countNum2 = 0
    var countNum3 = 0
    var timerRunning = false
    var timer = NSTimer()
    var nowNum = 0
    
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func start(sender: AnyObject) {

        if timerRunning == false {
            countNum = 0
            countNum2 = 0
            countNum3 = 0
            number1.text = "0"
            number2.text = "0"
            number3.text = "0"
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self,
                selector: Selector("update"), userInfo: nil, repeats: true)
            timerRunning = true
            nowNum = 1
            startButton.backgroundColor = UIColor.grayColor()
            stopButton.backgroundColor = UIColor(red: 0.49, green: 0.36, blue: 0.75, alpha: 1.0)
        }
        
    }

    @IBAction func stopButton1(sender: AnyObject) {
        if timerRunning == true {
            timer.invalidate()
            timerRunning = false
        }
        
        if timerRunning == false {
            countNum = 0
            
            switch nowNum {
            case 1:
                timer = NSTimer.scheduledTimerWithTimeInterval(0.08, target: self, selector: Selector("update2"), userInfo: nil, repeats: true)
                timerRunning = true
                nowNum = 2
            case 2:
                timer = NSTimer.scheduledTimerWithTimeInterval(0.08, target: self, selector: Selector("update3"), userInfo: nil, repeats: true)
                timerRunning = true
                nowNum = 3
            default:
                timer.invalidate()
                timerRunning = false
                stopButton.backgroundColor = UIColor.grayColor()
                startButton.backgroundColor = UIColor(red: 0.49, green: 0.36, blue: 0.75, alpha: 1.0)
            }

        }

    }
    
    func update() {
        countNum++
        number1.text = "\(countNum % 10)"
    }
    
    func update2() {
        countNum++
        number2.text = "\(countNum % 10)"
    }
    
    func update3() {
        countNum++
        number3.text = "\(countNum % 10)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number1.layer.masksToBounds = true
        number1.layer.cornerRadius = 5.0
        
        number2.layer.masksToBounds = true
        number2.layer.cornerRadius = 5.0
        
        number3.layer.masksToBounds = true
        number3.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
