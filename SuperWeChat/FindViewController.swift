//
//  FindViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/23.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {
    var findTableView = FindTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.findTableView.controllerTarget = self
        self.findTableView.register(FindTableViewCell.self, forCellReuseIdentifier: "cell")
        self.setNavigationTitle(findTitle)
        self.view.addSubview(findTableView)
        findTableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
