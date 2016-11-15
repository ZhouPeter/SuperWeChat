//
//  OthersTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/18.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class OthersTableViewCell: UITableViewCell {
    
    var leftImageView = UIImageView()
    var titleLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(leftImageView)
        self.addSubview(titleLabel)
        setAutoLayout()
    }
    
    
    func setAutoLayout() {
        leftImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(leftImageView)
        }
    }
    func setData(title:String,imageName:String)
    {
        
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.text = title
        leftImageView.image = UIImage(named:imageName)
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
