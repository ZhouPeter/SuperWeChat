//
//  MailListTableView.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/22.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MailListTableView: UITableView {
    var VM = MailListTableViewModel()
    deinit{
        print("tableView release")
    }
     override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        VM.target = self
        self.delegate = VM
        self.dataSource = VM
        self.tableFooterView = UIView()
        self.estimatedRowHeight = 60
        self.rowHeight = UITableViewAutomaticDimension
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
