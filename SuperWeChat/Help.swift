//
//  Help.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/20.
//  Copyright © 2016年 周. All rights reserved.
//

import Foundation



func addOrRemoveBlur(target:UIViewController,style:UIBlurEffectStyle? = nil,size:CGSize? = nil) {
    //首先创建一个模糊效果
    if let view = target.view.viewWithTag(12345) {
        view.removeFromSuperview()
    }else{
        var blurEffect = UIBlurEffect()
        if #available(iOS 10.0, *) {
            blurEffect = UIBlurEffect(style: style!)
        } else {
            if  [.extraLight,.light,.dark].contains(style!){
                blurEffect = UIBlurEffect(style: style!)
            }
            blurEffect = UIBlurEffect(style: .extraLight)
        }
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.tag = 12345
        //设置模糊视图的大小
        blurView.frame.size = size!
        target.view.addSubview(blurView)
    }
    
}




