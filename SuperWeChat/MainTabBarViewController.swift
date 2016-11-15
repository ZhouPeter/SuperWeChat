//
//  MainTabBarViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.tintColor = .red
        self.addAllChild()
        
    }


}
extension MainTabBarViewController{
     func  addAllChild(){
        
        addChild(WeChatViewController(), title: "微信", image: "duihua", selected: "duihua_selected")
        addChild(MailListViewController(), title: "通讯录", image: "tongxunlu", selected: "tongxunlu_selected")
        addChild(FindViewController(), title: "发现", image: "faxian", selected: "faxian_selected")
        
        addChild(MineViewController(), title: "我", image: "mine", selected: "mine_selected")
    }
    func addChild(_ childVC: UIViewController, title: String?, image: String, selected: String){
        let childNaviagation = UINavigationController(rootViewController: childVC)
        addChildViewController(childNaviagation)
        childNaviagation.navigationBar.tintColor = UIColor.white
        childNaviagation.navigationBar.barStyle = .black
        childNaviagation.navigationBar.barTintColor = naviBarBlack
        // UIImageRenderingModeAlwaysOriginal 始终绘制图片原始状态，不使用Tint Color
        let tabBarItem = UITabBarItem(title: title, image: UIImage(named: image)?.withRenderingMode(.alwaysTemplate), selectedImage: UIImage(named: selected)?.withRenderingMode(.alwaysOriginal))
        //设置选中BarItem的文字颜色
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.hexStringToColor(hexString: "0X11cd6e")], for: .selected)
        childNaviagation.tabBarItem = tabBarItem
        
    }
}
