//
//  Range+Extension.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/20.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit


extension NSRange{
    
    func toRangeByString(content:String) -> Range<String.Index> {
        let startIndex =  content.characters.index(content.startIndex, offsetBy: self.location)
        let endIndex = content.characters.index(content.startIndex, offsetBy: self.location + self.length)
        let newRange :Range<String.Index> = Range(uncheckedBounds: (startIndex,endIndex))
        return newRange
    }
   
}




struct Test {
    let name :String
    let age: Int
    init(all:(name:String,age:Int)) {
        self.name = all.name
        self.age = all.age
    }
    
}

extension Test{
    
    static func newTest() -> Test {
        let a = Test(all: ("123",12))
        return a
    }
}





