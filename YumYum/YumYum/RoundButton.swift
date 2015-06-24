//
//  RoundButton.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/21.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class RoundButton: UIButton {


    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0)
        self.layer.shadowRadius = 1.0
        self.layer.shadowColor = UIColor.blackColor().CGColor
    }
}
