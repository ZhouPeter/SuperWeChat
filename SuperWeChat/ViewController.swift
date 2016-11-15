//
//  ViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    var btn :UIButton!
    

    var name = "123"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        btn = UIButton()
        btn.frame.size = CGSize(width: 100, height: 50)
        btn.center = view.center
        btn.setTitle("showMenu", for: UIControlState())
        btn.setTitleColor(UIColor.black, for: UIControlState())
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(ViewController.presentVC(_:)), for: .touchUpInside)
        self.navigationItem.title = "1234"
    }
    
    
    
    func presentVC(_ sender:AnyObject?){
        let vc  = MailListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    let titles: [String] =
        ["加好友",
         "创建讨论组",
         "发送到电脑",
         "面对面快传",
         "收钱"]
    let images: [String] =
        [ "right_menu_addFri",
          "right_menu_multichat",
          "right_menu_sendFile",
          "right_menu_facetoface",
          "right_menu_payMoney"]
    
    func showMenu(_ sender: AnyObject?) {
        print("123")
        var obj : [AnyObject] = []
        for i in 0 ..< titles.count {
            let info = WBPopMenuModel()
            info.image = self.images[i]
            info.title = self.titles[i]
            obj.append(info)
        }
        WBPopMenuSingleton.shareManager().showPopMenuSelecte(withFrame: 150, item: obj) { (i) in
            print("点击第\(i)行")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
 


}


