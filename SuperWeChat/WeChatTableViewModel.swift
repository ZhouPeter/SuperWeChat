
//
//  WeChatTableViewModel.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class WeChatTableViewModel: NSObject,UITableViewDelegate,UITableViewDataSource
{
    weak var target: WeChatTableView!
    //MARK: --TableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    //MARK: --TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: target.identifier, for: indexPath) as! WeChatTableViewCell
        cell.setAutoLayout()
        return cell
    }

}
