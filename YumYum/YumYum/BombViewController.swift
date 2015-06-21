//
//  BombViewController.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/19.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class BombViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
    
    lazy private var bomb:UIImageView  = self.setBombImage()
    lazy private var limitNumber:UInt32 = self.setLimitNumber()
    private var lifePoint:UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "風船ゲーム"
      
        //Naviagationbar潜り込み防止
        self.edgesForExtendedLayout = UIRectEdge.None
        
        gameView.addSubview(bomb)
    }

    @IBAction func button1Tapped(sender: AnyObject) {
        lifePoint++
    }
    
    @IBAction func button2Tapped(sender: AnyObject) {
        lifePoint+=2
    }
    
    @IBAction func button3Tapped(sender: AnyObject) {
        lifePoint+=3
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layoutBombImage()
    }
    
    private func setBombImage()  -> UIImageView {
        var bomb:UIImageView = UIImageView(image: UIImage(named: "Bomb"))
        return bomb
    }
    
    private func setLimitNumber () -> UInt32 {
        var number:UInt32 = arc4random()%10 + 10
        return number
    }
    
    private func layoutBombImage() {
        bomb.frame.size = CGSizeMake(100,100)
        bomb.center.x = gameView.frame.width/2
        bomb.center.y = gameView.frame.height/2
    }
}
