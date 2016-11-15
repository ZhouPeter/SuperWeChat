//
//  MailListDataViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/22.
//  Copyright © 2016年 周. All rights reserved.
//


import UIKit
class MailListTableViewModel: NSObject ,UITableViewDataSource,UITableViewDelegate{
    weak var target:MailListTableView!
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(section)
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "测试\((indexPath as NSIndexPath).row)"
        return cell
    }
    deinit{
        print("释放")
    }
}
