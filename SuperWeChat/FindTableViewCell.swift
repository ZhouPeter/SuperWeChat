//
//  FindTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/23.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell {
    var leftImageView: UIImageView!
    var rightImageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.leftImageView = UIImageView()
        self.rightImageView = UIImageView()
        self.titleLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(leftImageView)
        self.addSubview(rightImageView)
        self.addSubview(titleLabel)
        self.setAutoLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setAutoLayout()  {
        leftImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        rightImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-30)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(leftImageView)
            make.centerY.equalToSuperview()
            make.left.equalTo(leftImageView.snp.right).offset(10)
        }
        leftImageView.image = UIImage(named: "right_menu_multichat")
        rightImageView.image = UIImage(named: "right_menu_multichat")
        titleLabel.text = "朋友圈"
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
