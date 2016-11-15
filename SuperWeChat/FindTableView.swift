//
//  FindTableView.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/23.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class FindTableView: UITableView {
 
    weak var controllerTarget :FindViewController!
    var VM = FindTableViewModel()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: .grouped)
        VM.target = self
        self.delegate = VM
        self.dataSource = VM
        self.tableFooterView?.frame = CGRect.zero

       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
