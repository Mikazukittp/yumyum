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
    var onReadyGo:Bool = false
    
    @IBAction func start(sender: AnyObject) {
        if(onReadyGo){
            return
        }

        countLabel.textColor = UIColor.yellowColor()
        if (!countTimer.valid) {
            onReadyGo = true
            startBtn.setTitle("-", forState: UIControlState.Normal)
            let selector : Selector = "ready"
            countLabel.font = UIFont(name: "Let's go Digital", size: 75)
            countLabel.text = "Ready..."
            readyTimer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: selector, userInfo: nil, repeats: false)
        }else{
            countTimer.invalidate()
            startBtn.setTitle("START", forState: UIControlState.Normal)
        }
    }
    
    
    func ready() {
        let selector : Selector = "go"
        countLabel.font = UIFont(name: "Let's go Digital", size: 100)
        countLabel.text = "GO!!!"
        goTimer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: selector, userInfo: nil, repeats: false)
        readyTimer.invalidate()
    }
    
    func go() {
        let selector : Selector = "startCounter"
        countLabel.font = UIFont(name: "DSEG7 Classic", size: 80)
        countTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: selector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        goTimer.invalidate()
    }
    
    func startCounter() {
        onReadyGo = false
        startBtn.setTitle("STOP", forState: UIControlState.Normal)
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
        
        let timeSeconds = seconds > 9 ? String(seconds):" " + String(seconds)
        let timeFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        countLabel.text = "\(timeSeconds).\(timeFraction)"
        if(isOver){
            countLabel.text = "-" + countLabel.text! + " "
            countLabel.textColor = UIColor.redColor()
        }else if(seconds<7){
            countLabel.textColor = UIColor.blackColor()
        }
        
    }
}
