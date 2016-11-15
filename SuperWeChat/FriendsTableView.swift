//
//  FriendsTableView.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/24.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class FriendsTableView: UITableView {
    weak var controllerTarget :FriendsViewController!
    var VM = FriendsTableViewModel()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
//        self.registerNib(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        self.register(FriendsTableViewCell.self, forCellReuseIdentifier: "cell")
        VM.target = self
        //分割线设置
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        //指定代理
        self.delegate = VM
        self.dataSource = VM
        self.tableFooterView?.frame = CGRect.zero
        //cell行高自适应
        self.estimatedRowHeight = 350
        self.rowHeight = UITableViewAutomaticDimension
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  

}
