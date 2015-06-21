//
//  BombViewController.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/19.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class BombViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "風船ゲーム"
      
        //Naviagationbar潜り込み防止
        self.edgesForExtendedLayout = UIRectEdge.None
    }

}
