//
//  MineTableView.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineTableView: UITableView {
    
    weak var controllerTarget: MineViewController!
    var VM = MineTableViewModel()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        VM.target = self
        //指定代理和数据源
        self.delegate = VM
        self.dataSource = VM
        self.tableFooterView?.frame = CGRect.zero
        //注册cell
        self.register(FirstTableViewCell.self, forCellReuseIdentifier: "cellFirst")
        self.register(OthersTableViewCell.self, forCellReuseIdentifier: "cellOthers")
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
