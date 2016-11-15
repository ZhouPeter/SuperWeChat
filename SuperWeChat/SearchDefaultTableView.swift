//
//  SearchDefaultTableView.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/20.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SearchDefaultTableView: UITableView {
    
    
    weak var controllerTarget: WeChatSearchViewController!
    
    let VM = SearchDefaultTableViewModel()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.tableFooterView = UIView()
        self.separatorColor = .clear
        self.backgroundColor = RGBAndAlpha(r: 255, g: 255, b: 255, a: 0.5)
        self.register(SearchDefaultTableViewCell.self, forCellReuseIdentifier: "defaultFirst")
        VM.target = self
        self.delegate = VM
        self.dataSource = VM
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
