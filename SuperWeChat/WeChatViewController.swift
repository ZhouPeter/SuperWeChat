//
//  WeChatViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit


class WeChatViewController: UIViewController,CustomSearchControllerToControllerDelegate{
    fileprivate let identifier:String = "cell"
    //列表
    var weChatTableView  =  WeChatTableView()
    
  //搜索控制器
    var sc : WeChatSearchViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        print((self.navigationController?.navigationBar.isTranslucent)!)
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"headerImage")?.reSizeImage(reSize: CGSize(width: SCREEN_WIDTH, height: 64)), for: .default)
        
        print((self.navigationController?.navigationBar.isTranslucent)!)
        //设置背景图片后isTranslucent = false 需要修改回来
        self.navigationController?.navigationBar.isTranslucent = true
        //修改导航标题
        self.setNavigationTitle("微信")
        self.view.addSubview(weChatTableView)
        weChatTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
           
        }
        weChatTableView.controllerTarget = self
        //不能在初始化里面设置footerView  因为会触发代理方法,但是controllerTarget还没有被初始化
        weChatTableView.tableFooterView = UIView()
        configureCustomSearchController()
        //注册tableViewCell
        self.addBarButtonItem()

    }
   
    
    func  configureCustomSearchController(){
        sc = WeChatSearchViewController(searchResultsController:  SearchResultsViewController(), searchBarFrame: CGRect(x:0.0,y: 0.0,width:SCREEN_WIDTH-30,height: 50.0), searchBarFont: UIFont.systemFont(ofSize: 16), searchBarTextColor: UIColor.orange, searchBarTintColor: UIColor.black)
        sc.isActive = true
        sc.controllerTarget = self
        //tableView头部设置为搜索栏
        weChatTableView.tableHeaderView = sc.searchBar
        sc.VM.controllerDelegate = self
    }

    deinit {
        print("weChat is release")
    }
    


    func addBarButtonItem() {
         let rightItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(WeChatViewController.showMenu(_:)))
         self.navigationItem.rightBarButtonItem = rightItem
        
    }
    
    
    func addAction(_ sender:AnyObject?) {
         let vc  = ViewController()
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
     //MARK: -- WechatCustomSearchControllerDelegate
    func tabBarHidden() {
        self.tabBarController?.tabBar.isHidden = !(self.tabBarController?.tabBar.isHidden)!
    }


}
