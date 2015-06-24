//
//  BombViewController.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/19.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit
import Spring

class BombViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
    
    @IBOutlet weak var retryButton: RoundButton!
    @IBOutlet weak var button1: RoundButton!
    @IBOutlet weak var button2: RoundButton!
    @IBOutlet weak var button3: RoundButton!
    
    lazy private var bomb:SpringImageView  = self.setBombImage()
    lazy private var limitNumber:UInt32 = self.setLimitNumber()
    lazy private var gameOverView:SpringImageView = self.setGameOver()
    
    private var lifePoint:UInt32 = 0
    private var bombLevel:UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "LUCKY BALLOON"
      
        //Naviagationbar潜り込み防止
        self.edgesForExtendedLayout = UIRectEdge.None
        
        gameView.addSubview(bomb)
        gameView.addSubview(gameOverView)
        
        retryButton.hidden = true
        gameOverView.hidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layoutBombImage()
    }

    @IBAction func button1Tapped(sender: AnyObject) {
        lifePoint++
        self.bombAnimation()
        if (lifePoint > limitNumber) {
            self.gaveOver()
        }
    }
    
    @IBAction func button2Tapped(sender: AnyObject) {
        lifePoint+=2
        self.bombAnimation()
        if (lifePoint > limitNumber) {
            self.gaveOver()
        }
    }
    
    @IBAction func button3Tapped(sender: AnyObject) {
        lifePoint+=3
        self.bombAnimation()
        if (lifePoint > limitNumber) {
            self.gaveOver()
        }
    }
    
    @IBAction func retryButtonTapped(sender: AnyObject) {
        self.setLimitNumber()
        
        lifePoint = 0
        
        //再生性
        bomb.removeFromSuperview()
        bomb = self.setBombImage()
        gameView.addSubview(bomb)
        self.layoutBombImage()
        
        bomb.hidden  = false
        gameOverView.hidden  = true

        self.allowButton(button1, value: "1")
        self.allowButton(button2, value: "2")
        self.allowButton(button3, value: "3")

        retryButton.hidden = true
    }
    
    private func setBombImage()  -> SpringImageView {
        var bomb:SpringImageView = SpringImageView(image: UIImage(named: "Bomb1"))
        return bomb
    }
   
    private func setGameOver()  -> SpringImageView {
        var gameOver:SpringImageView = SpringImageView(image: UIImage(named: "GameOver"))
        return gameOver
    }

    
    private func setLimitNumber () -> UInt32 {
        var number:UInt32 = arc4random()%10 + 20
        println(number)
        return number
    }
    
    private func layoutBombImage() {
        bomb.frame.size = CGSizeMake(100,100)
        bomb.center.x = gameView.frame.width/2
        bomb.center.y = gameView.frame.height/2
        
        gameOverView.frame.size = CGSizeMake(gameView.frame.width - 10, gameView.frame.height - 10)
        gameOverView.center.x = bomb.center.x
        gameOverView.center.y = bomb.center.y
    }
    
    private func bombAnimation () {
        
        if (lifePoint > limitNumber) {
            return
        }
        
        changeBombImage()
        
        bomb.animation = "pop"
        bomb.curve = "easeIn"
        bomb.duration = 0.3
        bomb.damping = 0.8
        bomb.velocity = 1.0
        bomb.scaleX = CGFloat(lifePoint)*0.05 + 1
        bomb.scaleY = CGFloat(lifePoint)*0.05 + 1
        bomb.animateTo()
    }
    
    private func gaveOver () {
        retryButton.hidden = false
        self.disableButtons()
        bomb.hidden = true
        gameOverView.hidden  = false
    }
    
    private func changeBombImage (){
        
        let status2:UInt32 = limitNumber / 4;
        let status3:UInt32 = status2 * 2;
        let status4:UInt32 = status2 * 3;

        if (lifePoint > status4) {
            bomb.image = UIImage(named: "Bomb4")
        } else if(lifePoint > status3) {
            bomb.image = UIImage(named: "Bomb3")
        } else if(lifePoint > status2) {
            bomb.image = UIImage(named: "Bomb2")
        } else {
            bomb.image = UIImage(named: "Bomb1")
        }
}
    
    private func disableButtons () {
        self.disableButton(button1)
        self.disableButton(button2)
        self.disableButton(button3)
    }
    
    private func disableButton (button:UIButton) {
        button.setTitle("", forState: UIControlState.Normal)
        button.enabled = false
        button.backgroundColor = UIColor(white: 0.8, alpha: 1)
    }
    
    private func allowButton (button:UIButton,value:String) {
        button.setTitle(value, forState: UIControlState.Normal)
        button.enabled = true
        button.backgroundColor = UIColor.whiteColor()

    }
}
