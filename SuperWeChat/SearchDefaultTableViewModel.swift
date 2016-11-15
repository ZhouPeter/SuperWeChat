//
//  SearchDefaultTableViewModel.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 2016/9/21.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SearchDefaultTableViewModel: NSObject ,UITableViewDelegate,UITableViewDataSource{
    weak  var target : SearchDefaultTableView!
    
    
    var a = true
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if  a {
             cell  = tableView.dequeueReusableCell(withIdentifier: "defaultFirst", for:indexPath) as! SearchDefaultTableViewCell

        }else{
             cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
