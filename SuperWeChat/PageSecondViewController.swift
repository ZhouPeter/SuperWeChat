//
//  PageSecondViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 2016/9/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class PageSecondViewController: UIViewController {
    var index = 0
    var topView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalToSuperview().offset(64)
            make.centerX.equalToSuperview()
        }
        self.topView.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
