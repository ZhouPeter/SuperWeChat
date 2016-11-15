//
//  MailListViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/22.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit


class MailListViewController: UIViewController{
    //文件内私有 private为真正私有离开了这个类或者结构体的作用域外面就无法访问
    var index = 0
    fileprivate var name = "private"
    //通讯录tableView
    var contactTableView = MailListTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.setNavigationTitle(mailListTitle)
        self.view.addSubview(contactTableView)
        contactTableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()

        }
        self.addBarButtonItem()
 
    }

    func addBarButtonItem(){
        let rightBarButton =  UIBarButtonItem(image: UIImage(named: "add"), style: .done, target: self, action: #selector(MailListViewController.rightAction(sender:)) )
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    func rightAction(sender :AnyObject?){
        print("add Man")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension MailListViewController{
    var accessPrivate: String {
        return name
    }
}
