//
//  Config.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit



//屏幕宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

//屏幕高度
let SCREEN_HEIGTH = UIScreen.main.bounds.size.height


let SCREEN_SIZE = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGTH)
//红色常量
let MAIN_RED = UIColor(colorLiteralRed: 235.0/255.0, green: 114.0/255.0, blue: 118.0/255.0, alpha: 1)

//导航栏颜色
let naviBarBlack = UIColor(colorLiteralRed: 42.0/255.0, green:32.0/255.0 , blue: 32.0/255.0, alpha: 1)

//朋友圈评论点赞view背景色
let showViewColor = UIColor(colorLiteralRed: 84.0/255.0, green:75.0/255.0 , blue: 80.0/255.0, alpha: 1)

//导航栏标题

let mailListTitle = "通讯录"
let findTitle = "发现"
let friendsTitle  = "朋友圈"
let mineTitle = "我"

func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}
//两者效果测试看来是一样的  前者为swift独有的api 参数类型为Float 后者参数类型CGFloat
func RGBAndAlpha(r:Float,g:Float,b:Float, a: Float) ->UIColor{
    return UIColor(colorLiteralRed: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGBAndAlpha2(r:CGFloat,g:CGFloat,b:CGFloat, a: CGFloat) ->UIColor{
    return UIColor(red:  r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGBAndAlpha3(r:CGFloat,g:CGFloat,b:CGFloat, a: CGFloat) ->UIColor{
    if #available(iOS 10.0, *) {
        return UIColor(displayP3Red:  r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    } else {
        return UIColor(red:  r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
