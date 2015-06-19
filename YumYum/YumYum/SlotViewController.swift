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
    
    @IBAction func start(sender: AnyObject) {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            timerRunning = true
        }
    }

    @IBOutlet weak var number1: UILabel!
    
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    
    @IBAction func stopButton1(sender: AnyObject) {
        if timerRunning == true {
            timer.invalidate()
            timerRunning = false
        }
        
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update2"), userInfo: nil, repeats: true)
            timerRunning = true
        }

    }

    @IBAction func stopButton2(sender: AnyObject) {
        if timerRunning == true {
            timer.invalidate()
            timerRunning = false
        }
        
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update3"), userInfo: nil, repeats: true)
            timerRunning = true
        }

    }
    
    @IBAction func stopButton3(sender: AnyObject) {
        if timerRunning == true {
            timer.invalidate()
            timerRunning = false
        }
    }
    
    func update() {
        countNum++
        number1.text = "\(countNum % 10)"
    }
    
    func update2() {
        countNum2++
        number2.text = "\(countNum2 % 10)"
    }
    
    func update3() {
        countNum3++
        number3.text = "\(countNum3 % 10)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
