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
    
    @IBAction func start(sender: AnyObject) {
        if (!countTimer.valid) {
            startBtn.setTitle("STOP", forState: UIControlState.Normal)
            let selector : Selector = "ready"
            countLabel.text = "Ready..."
            countLabel.textColor = UIColor.blackColor()
            readyTimer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: selector, userInfo: nil, repeats: false)
        }else{
            countTimer.invalidate()
            startBtn.setTitle("START", forState: UIControlState.Normal)
            countLabel.alpha = 1
        }
    }
    
    
    func ready() {
        let selector : Selector = "go"
        countLabel.text = "GO!!!"
        goTimer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: selector, userInfo: nil, repeats: false)
        readyTimer.invalidate()
    }
    
    func go() {
        let selector : Selector = "startCounter"
        countTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: selector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        goTimer.invalidate()
    }
    
    func startCounter() {
        var isOver = false
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        var time: NSTimeInterval = currentTime - startTime
        
        if(time < 10){
            time = 10 - time
        }else{
            time -= 10
            isOver = true
        }
        
        let seconds = UInt32(time)
        time -= NSTimeInterval(seconds)
        
        let fraction = UInt32(time * 100)
        
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
