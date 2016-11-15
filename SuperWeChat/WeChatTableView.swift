//
//  WeChatTableView.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class WeChatTableView: UITableView {
    let identifier:String = "cell"
    weak var controllerTarget: WeChatViewController!
    var VM = WeChatTableViewModel()
    deinit{
        print("tableView release")
    }
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        VM.target = self
        self.delegate = VM
        self.dataSource = VM
        self.register(WeChatTableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
