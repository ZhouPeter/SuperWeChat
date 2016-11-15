//
//  SearchDefaultTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SearchDefaultTableViewCell: UITableViewCell {
    var leftButton = TopImageButton()
    
    var rightButton = TopImageButton()
    var centerButton = TopImageButton()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(leftButton)
        self.contentView.addSubview(rightButton)
        self.contentView.addSubview(centerButton)
        self.backgroundColor = UIColor.clear
        let buttonWidth = 60.0
        let buttonHeight = 150.0
        let topSpace = 150.0
        let spaceWidth = (Double(SCREEN_WIDTH)-buttonWidth * 3)/4
        leftButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(spaceWidth)
            make.top.equalToSuperview().offset(topSpace)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        rightButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-spaceWidth)
            make.top.equalTo(leftButton)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        centerButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(leftButton)
            make.centerY.equalTo(leftButton)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
