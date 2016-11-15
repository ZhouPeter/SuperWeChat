//
//  WeChatTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
class WeChatTableViewCell: UITableViewCell {

    var leftImageView: UIImageView!
    var titelLabel:UILabel!
    var messageLabel:UILabel!
    var timeLabel:UILabel!
    //指定构造器
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.leftImageView = UIImageView()
        self.titelLabel = UILabel()
        self.messageLabel = UILabel()
        self.timeLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(leftImageView)
        self.contentView.addSubview(titelLabel)
        self.contentView.addSubview(messageLabel)
        self.contentView.addSubview(timeLabel)
        

    }
    
    /**
      自动布局设置
     */
     func setAutoLayout() {
        self.leftImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(70)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        self.titelLabel.snp.makeConstraints { (make) in
            make.height.equalTo(leftImageView).multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.left.equalTo(leftImageView.snp.right).offset(20)
            make.top.equalTo(leftImageView.snp.top)
        }
        self.messageLabel.snp.makeConstraints { (make) in
            make.width.height.equalTo(titelLabel)
            make.left.equalTo(titelLabel)
            make.top.equalTo(titelLabel.snp.bottom)
        }
        self.timeLabel.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.top.equalTo(titelLabel)
            make.right.equalToSuperview().offset(-20)
        }
        leftImageView.image = UIImage(named: "headerImage")
        titelLabel.text = "微信测试微信测试微信测试微信测试"
        messageLabel.text = "微信测试微信测试微信测试微信测试"
        timeLabel.text = "下午6:30"
        timeLabel.textAlignment = .right
        timeLabel.font = UIFont.systemFont(ofSize: 11)

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
