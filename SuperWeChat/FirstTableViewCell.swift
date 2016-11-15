//
//  FirstTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    var userImageView = UIImageView()
    var nameLabel = UILabel()
    var nicknameLabel = UILabel()
    var rightImageView = UIImageView()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(userImageView)
        self.addSubview(nameLabel)
        self.addSubview(nicknameLabel)
        self.addSubview(rightImageView)
        setAutoLayout()
        setData()

    }
    
    private func setAutoLayout(){
        userImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userImageView).offset(6)
            make.height.equalTo(userImageView).multipliedBy(0.4)
            make.left.equalTo(userImageView.snp.right).offset(8)
            
        }
        nicknameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(userImageView).offset(-6)
            make.height.equalTo(userImageView).multipliedBy(0.4)
            make.left.equalTo(nameLabel)
        }
    }
    func setData()  {
        userImageView.layer.cornerRadius = 3
        userImageView.layer.masksToBounds = true
        userImageView.image = UIImage(named: "donostia")
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.text = "Super—WeChat"
        nicknameLabel.font = UIFont.systemFont(ofSize: 11)
        nicknameLabel.text = "微信号：WeChat-number"
        
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
