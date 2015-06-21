//
//  CountViewController.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/19.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class CountViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    var startTime = NSTimeInterval()
    var countTimer:NSTimer = NSTimer()
    var readyTimer:NSTimer = NSTimer()
    var goTimer:NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func start(sender: AnyObject) {
        if (!countTimer.valid) {
            startBtn.setTitle("STOP", forState: UIControlState.Normal)
            let mySelector : Selector = "ready"
            countLabel.text = "Ready..."
            countLabel.textColor = UIColor.blackColor()
            readyTimer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: mySelector, userInfo: nil, repeats: false)
        }else{
            countTimer.invalidate()
            startBtn.setTitle("START", forState: UIControlState.Normal)
            countLabel.alpha = 1
        }
    }
    
    
    func ready() {
        let mySelector : Selector = "go"
        countLabel.text = "GO!!!"
        goTimer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: mySelector, userInfo: nil, repeats: false)
        readyTimer.invalidate()
    }
    
    func go() {
        let mySelector : Selector = "myStartTime"
        countTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: mySelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        goTimer.invalidate()
    }
    
    func myStartTime() {
        var isOver = false
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        var myTime: NSTimeInterval = currentTime - startTime
        
        if(myTime < 10){
            myTime = 10 - myTime
        }else{
            myTime -= 10
            isOver = true
        }
        
        let seconds = UInt8(myTime)
        myTime -= NSTimeInterval(seconds)
        
        let fraction = UInt8(myTime * 100)
        
        let timeSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let timeFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        countLabel.text = "\(timeSeconds):\(timeFraction)"
        if(isOver){
            countLabel.text = "-" + countLabel.text!
            countLabel.textColor = UIColor.redColor()
        }else if(seconds<7){
            countLabel.alpha = 0
        }
        
    }
}
