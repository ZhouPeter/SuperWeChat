//
//  MineViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    var mineTableView :MineTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle(mineTitle)
        mineTableView = MineTableView(frame: self.view.frame, style: .grouped)
        mineTableView.controllerTarget = self
        self.view.addSubview(mineTableView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    

}
