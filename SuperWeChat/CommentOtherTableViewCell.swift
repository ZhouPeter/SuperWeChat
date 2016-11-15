//
//  CommentOtherTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/31.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CommentOtherTableViewCell: UITableViewCell {
    var commentLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(commentLabel)
        setAutoLayout()
        
    }
    func setAutoLayout() {
        commentLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(2)
            make.centerY.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
    
    func setData(_ commentString:String){
        commentLabel.font = UIFont.systemFont(ofSize: 11)
        commentLabel.lineBreakMode = .byCharWrapping
        commentLabel.numberOfLines = 0
        commentLabel.text =  commentString
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
