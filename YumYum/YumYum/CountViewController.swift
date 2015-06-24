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
    var isOver = false
    
    let PARTY_FONT:String = "Party LET"
    let DIGITAL_FONT:String = "DSEG7 Classic"

    
    @IBAction func start(sender: AnyObject) {
        if(onReadyGo){
            return
        }

        if (!countTimer.valid) {
            onReadyGo = true
            isOver=false
            startBtn.setTitle("", forState: UIControlState.Normal)
            startBtn.enabled = false
            startBtn.backgroundColor = UIColor(white: 0.8, alpha: 1)
            let selector : Selector = "ready"
            countLabel.font = UIFont(name: PARTY_FONT, size: 90)
            countLabel.text = "Ready..."
            countLabel.textColor = UIColor.yellowColor()
            readyTimer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: selector, userInfo: nil, repeats: false)
        }else{
            countTimer.invalidate()
            if(isOver){
                countLabel.textColor = UIColor.redColor()
            }else{
                countLabel.textColor = UIColor.yellowColor()
            }
            startBtn.setTitle("START", forState: UIControlState.Normal)
        }
    }
    
    
    func ready() {
        let selector : Selector = "go"
        countLabel.font = UIFont(name: PARTY_FONT, size: 110)
        countLabel.text = "GO!!!"
        goTimer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: selector, userInfo: nil, repeats: false)
        readyTimer.invalidate()
    }
    
    func go() {
        let selector : Selector = "startCounter"
        countLabel.font = UIFont(name: DIGITAL_FONT, size: 80)
        countTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: selector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        goTimer.invalidate()
    }
    
    func startCounter() {
        onReadyGo = false
        startBtn.setTitle("STOP", forState: UIControlState.Normal)
        startBtn.enabled = true
        startBtn.backgroundColor = UIColor.whiteColor()
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        var time: NSTimeInterval = currentTime - startTime
        
        if(time < 10.01){ // time<=10としたいところだがtimeは0.00秒以下も保持しているため time < 10.01とした
            time = 10 - time
        }else{
            time -= 10
            isOver = true
        }
        
        let seconds = UInt32(time)
        time -= NSTimeInterval(seconds)
        if(isOver && seconds > 9){
            countLabel.text = "-9.99"
            return
        }
        
        let fraction = UInt32(time * 100)
        
        let timeSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let timeFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        countLabel.text = "\(timeSeconds).\(timeFraction)"
        if(isOver){
            countLabel.text = "-" + "\(seconds).\(timeFraction)" + " "
        }else if(seconds==6){
            // フェードのために色を計算
            // RGB(1,1,0) -- 1s --> (0.33,0.33,0.33)
            var d:Double = 0.66 * Double(100-fraction)/100
            countLabel.textColor = UIColor(red: CGFloat(1-d), green: CGFloat(1-d), blue: CGFloat(d*0.5), alpha: 1)
        }else if(seconds<6){
            countLabel.textColor = UIColor(red: 0.33, green: 0.33, blue: 0.33, alpha: 1)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ボタンに影をつけたい
        startBtn.layer.shadowOpacity = 1
        startBtn.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        startBtn.layer.shadowRadius = 1.0
        startBtn.layer.shadowColor = UIColor.blackColor().CGColor
    }
}
