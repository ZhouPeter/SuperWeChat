//
//  FindTableViewModel.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/23.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
class FindTableViewModel: NSObject ,UITableViewDelegate,UITableViewDataSource{
    
    weak var target :FindTableView!

    //MARK:-- tableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int{

        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:
            return 1
        default:
            return 2
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell
    
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FindTableViewCell
        if (indexPath as NSIndexPath).section != 0  {
            cell.rightImageView.isHidden = true
        }
        cell.accessoryType = .disclosureIndicator
        
        return  cell
    }
    
    
    
    
    
    
    //MARK: -- tableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
       return section == 0 ? 15 : 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 10
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendsVC = FriendsViewController()
        tableView.selectRow(at: nil, animated: true, scrollPosition: .none)
        self.target.controllerTarget.navigationController?.pushViewController(friendsVC, animated: true)
    
    }
    


    
    
    
}
