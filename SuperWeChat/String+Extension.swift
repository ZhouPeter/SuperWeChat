//
//  extension.swift
//  Demo_checkCell
//
//  Created by 李春波 on 16/8/10.
//  Copyright © 2016年 lcb. All rights reserved.
//

import UIKit

extension String{
    
//    MARK:获得string内容高度
    
    func stringHeightWith(_ fontSize:Int,width:CGFloat)->CGFloat{
        let fontSizeFloat = CGFloat(fontSize)
        let font = UIFont.systemFont(ofSize: fontSizeFloat)
        
        let size = CGSize(width: width,height: CGFloat.greatestFiniteMagnitude)
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineBreakMode = .byWordWrapping;
        
        let attributes = [NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy()]
        
        let text = self as NSString
        
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        
        return rect.size.height
        
    }
    
}

func heightByData(_ data:String ,fontSize: Int,width:CGFloat)->CGFloat{
    
    let content = data
    let height = content.stringHeightWith(fontSize,width:width)
    return  height
    
}

func cellHeightByImageCount(_ imageNum:Int)->CGFloat{
    
    let lines:CGFloat = (CGFloat(imageNum))/3
    var picHeight:CGFloat = 0
    
    let  imageWidth = (SCREEN_WIDTH - 70*2 - 10)/3

    switch lines{
    case 0...1:
        picHeight = imageWidth + 2*5
        break
    case 1...2:
        picHeight = imageWidth*2 + 3*5
        break
    case 2...3:
        picHeight = imageWidth*3 + 4*5
        break
    default:
        picHeight = 0
    }
    return picHeight
    
    
    
}

func cellHeightByCommentNum(_ Comment:Int)->CGFloat{
    return CGFloat(Comment * 20)
}


