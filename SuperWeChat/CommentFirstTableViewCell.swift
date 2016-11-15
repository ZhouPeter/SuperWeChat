//
//  CommentFirstTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/30.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class CommentFirstTableViewCell: UITableViewCell {
    
    
    var storeLable = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(storeLable)
        setAutoLayout()
    }
    func setAutoLayout(){
        storeLable.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(2)
            make.centerY.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
    
    func  setData(_ storeNames:String) {
        storeLable.font = UIFont.systemFont(ofSize: 11)
        storeLable.numberOfLines = 0
        storeLable.text = storeNames
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
