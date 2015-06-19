//
//  TopViewController.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/19.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func slotTapped(sender: AnyObject) {
        var pc = SlotViewController(nibName: "SlotViewController", bundle: nil)
        
        self.navigationController?.pushViewController(pc, animated: true);
    }

    @IBAction func countTapped(sender: AnyObject) {
        var pc = CountViewController(nibName: "CountViewController", bundle: nil)
        
        self.navigationController?.pushViewController(pc, animated: true);

    }
    @IBAction func bombTapped(sender: AnyObject) {
        var pc = BombViewController(nibName: "BombViewController", bundle: nil)
        
        self.navigationController?.pushViewController(pc, animated: true);

    }
}
