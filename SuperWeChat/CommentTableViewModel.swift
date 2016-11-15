//
//  CommentTableViewModel.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/30.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CommentTableViewModel: NSObject,UITableViewDelegate,UITableViewDataSource {
    weak var target : CommentTableView!
    var storeNames: String!
    var commentArray:[[String:String]]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return storeNames == nil || storeNames == "" ? commentArray.count : commentArray.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if (indexPath as NSIndexPath).row == 0{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! CommentFirstTableViewCell
            cell.setData(storeNames)
            return cell
        }else{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "otherCell", for: indexPath) as! CommentOtherTableViewCell
            var commentString : String
            commentString = commentArray[(indexPath as NSIndexPath).row - 1]["name"]!
            if commentArray[(indexPath as NSIndexPath).row - 1]["toName"] != ""{
                commentString += "回复" + commentArray[(indexPath as NSIndexPath).row - 1]["toName"]!
            }
            commentString += ": " + commentArray[(indexPath as NSIndexPath).row - 1]["connect"]!
            cell.setData(commentString)
            return cell
        }
    }

    


}
