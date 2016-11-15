//
//  CommentTableView.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/30.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CommentTableView: UITableView {
    weak var controllerTarget :FriendsTableViewCell!
    var VM = CommentTableViewModel()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        VM.target = self
        //注册cell
        self.register(CommentFirstTableViewCell.self, forCellReuseIdentifier: "firstCell")
        self.register(CommentOtherTableViewCell.self, forCellReuseIdentifier: "otherCell")

        //分割线设置
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        //指定代理
        self.delegate = VM
        self.dataSource = VM
        self.tableFooterView?.frame = CGRect.zero
        self.estimatedRowHeight = 50
        self.rowHeight = UITableViewAutomaticDimension

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
