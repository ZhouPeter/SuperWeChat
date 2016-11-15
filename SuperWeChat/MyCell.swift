//
//  MyCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

  
    @IBOutlet weak var testLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setString(_ str:String)
    {
        self.testLabel.text = str
    }
    
    
    
    
    

}
