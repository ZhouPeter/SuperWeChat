//
//  MineTableViewModel.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MineTableViewModel: NSObject ,UITableViewDelegate,UITableViewDataSource{
    weak var target : MineTableView!
    
    private var data1 = [["title":"相册","image":"xiangce"],["title":"收藏","image":"shoucang"],["title":"钱包","image":"qianbao"],["title":"优惠券","image":"youhuijuan"]]
    private var data2 = [["title":"表情","image":"biaoqing"]]
    private var data3  = [["title":"设置","image":"shezhi"]]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 4
        default:
            return 1
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.section == 0{
            let cellFirst = tableView.dequeueReusableCell(withIdentifier: "cellFirst", for: indexPath) as! FirstTableViewCell
             cellFirst.accessoryType = .disclosureIndicator
            return cellFirst
        }else{
            let  cellOthers = tableView.dequeueReusableCell(withIdentifier: "cellOthers", for: indexPath) as! OthersTableViewCell
            var data:[[String:String]] = switchData(section: indexPath.section)
            cellOthers.setData(title: data[indexPath.row]["title"]!, imageName: data[indexPath.row]["image"]! )
            cellOthers.accessoryType = .disclosureIndicator
            return cellOthers
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 15 : 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 80 : 40
    }
    
    //选择Others数据源
    private func switchData(section:Int) -> [[String:String]]{
        switch section {
           case 1:
              return data1
           case 2:
              return data2
           case 3:
              return data3
           default: return [[:]]
        }

    }

}
