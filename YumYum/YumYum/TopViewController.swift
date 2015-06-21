//
//  TopViewController.swift
//  YumYum
//
//  Created by 石部達也 on 2015/06/19.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit
import GoogleMobileAds


class TopViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBannerView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func slotTapped(sender: AnyObject) {
        var pc = SlotViewController(nibName: "SlotViewController", bundle: nil)
        
        self.navigationController?.pushViewController(pc, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func countTapped(sender: AnyObject) {
        var pc = CountViewController(nibName: "CountViewController", bundle: nil)
        
        self.navigationController?.pushViewController(pc, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    @IBAction func bombTapped(sender: AnyObject) {
        var pc = BombViewController(nibName: "BombViewController", bundle: nil)
        
        self.navigationController?.pushViewController(pc, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setBannerView() {
        
        #if DEBUG
            let adUnitID = "ca-app-pub-3940256099942544/2934735716"
        #else
            let adUnitID = "ca-app-pub-8668651775161815/1412551083"
        #endif
        
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
    }
}
