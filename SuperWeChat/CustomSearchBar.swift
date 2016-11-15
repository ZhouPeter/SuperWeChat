//
//  WeChatSearchBar.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 2016/9/22.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        self.searchBarStyle = .minimal
        self.isTranslucent = true
        
    }
    override func draw(_ rect: CGRect) {
         super.draw(rect)
        // 获取搜索栏子视图中搜索输入框的下标
        if let index = indexOfSearchFieldInSubviews() {
            // 获取搜索输入框
            let searchField: UITextField = (self.subviews[0]).subviews[index] as! UITextField
            
            // 设置 frame
            searchField.frame = CGRect(x:5.0,y: 5.0,width: frame.size.width - 50.0, height:frame.size.height - 10.0)
            //设置右侧图标
            let voiceImageView = UIImageView()
            voiceImageView.image = UIImage(named: "voice")
            searchField.rightView = voiceImageView
            // 设置字体和文字颜色
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            
            // 设置背景颜色
            searchField.backgroundColor = barTintColor
        }
        
       
    }
    //获取textField索引
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i] is UITextField {
                index = i
                break
            }
        }
        return index
    }
    func beginVoice(_ sender: UIButton){
        print("voice")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
