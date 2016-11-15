//
//  FriendsTableViewModel.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/24.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
class FriendsTableViewModel: NSObject,UITableViewDelegate,UITableViewDataSource,FriendsTableCellDelegate {
    weak var target:FriendsTableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 6
    }

    //设置分割线
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsets.zero
        }
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = (indexPath as NSIndexPath).row
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsTableViewCell
        cell.delegate = self
        cell.setData( "headerImage", userName: dataItem[row]["name"] as! String, userMessage: dataItem[row]["content"] as! String, imageUrls: dataItem[row]["imageUrls"] as![String]?)
        cell.selectionStyle = .none
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //移除点赞评论view
        self.removeSubView(10086)
    }
    func updateTableView(){
        self.target.beginUpdates()
        self.target.endUpdates()
    }

    func removeSubView(_ tag:Int)  {
        self.target.viewWithTag(10086)?.removeFromSuperview()
    }
    

}
