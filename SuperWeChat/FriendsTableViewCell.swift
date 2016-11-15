//
//  FriendsTableViewCell.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/24.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
import SDWebImage
protocol FriendsTableCellDelegate:NSObjectProtocol{
    func updateTableView()
    func removeSubView(_ tag:Int)
}


protocol ItemViewDelegate:NSObjectProtocol{
    func toStore()
}
class ItemView: UIView
{
    var storeItem = UIButton()
    var commentItem = UIButton()
    var lineView = UIView()
    weak var delegate:ItemViewDelegate!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(storeItem)
        self.addSubview(commentItem)
        self.addSubview(lineView)
        setAutoLayout()
        setData()
    }
    func setAutoLayout(){
         storeItem.snp.makeConstraints { (make) in
            make.height.equalTo(18)
            make.width.equalTo(70)
            make.left.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
        }
        commentItem.snp.makeConstraints { (make) in
            make.height.width.equalTo(storeItem)
            make.right.equalToSuperview().offset(-5)
            make.centerY.equalToSuperview()
        }
        lineView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(0.5)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
    }
    func setData(){
        self.backgroundColor = showViewColor
        storeItem.setTitle("赞", for: UIControlState())
        storeItem.setImage(UIImage(named: "likewhite"), for: UIControlState())
        storeItem.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        storeItem.setTitleColor(UIColor.white, for: UIControlState())
        storeItem.addTarget(self, action: #selector(ItemView.storeAction(_:)), for: .touchUpInside)
        commentItem.setTitle("评论", for: UIControlState())
        commentItem.setImage(UIImage(named: "comment"), for: UIControlState())
        commentItem.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        commentItem.setTitleColor(UIColor.white, for: UIControlState())
        commentItem.addTarget(self, action: #selector(ItemView.commentAction(_:)), for: .touchUpInside)
        lineView.backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func storeAction(_ sender: AnyObject?){
        delegate.toStore()
        print("点赞成功")
        
    }
    func commentAction(_ sender: AnyObject?){
        print("评论")
    }
}


class FriendsTableViewCell: UITableViewCell,ItemViewDelegate {
    
    weak var delegate : FriendsTableCellDelegate!
    var userHeaderImageView = UIImageView()
    var userNameLabel = UILabel()
    var userMessageLabel = UILabel()
    var imageContentView = UIView()
    var moreItem = UIButton()
    var timeLabel = UILabel()
    var showItem = UIButton()
    var itemView = ItemView()
    var commentTableView = CommentTableView()

    
    
    var storeNames:[String]!
    var commentArray:[[String:String]]!
    var isStore = false
    var isMore = false
    var userMessage : String!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(userHeaderImageView)
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(userMessageLabel)
        self.contentView.addSubview(imageContentView)
        self.contentView.addSubview(moreItem)
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(showItem)
        self.contentView.addSubview(commentTableView)
        self.setAutoLayout()
    }
    

    /**
     自动布局
     */
    func setAutoLayout(){
        userHeaderImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.left.top.equalToSuperview().offset(10)
        }
        userNameLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(userHeaderImageView)
            make.left.equalTo(userHeaderImageView.snp.right).offset(10)
        }
        userMessageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userNameLabel)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(userNameLabel.snp.bottom)
        }
        moreItem.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(0)
            make.top.equalTo(userMessageLabel.snp.bottom)
            make.left.equalTo(userMessageLabel)
        }
        showItem.snp.makeConstraints { (make) in
            make.top.equalTo(moreItem.snp.bottom)
            make.height.equalTo(10)
            make.width.equalTo(15)
            make.right.equalToSuperview().offset(-10)
        }
        imageContentView.snp.makeConstraints{ (make) in
            make.left.equalTo(moreItem)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(0).priority(750)
            make.top.equalTo(moreItem.snp.bottom).offset(5)
        }

        timeLabel.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalTo(100)
            make.left.equalTo(imageContentView)
            make.top.equalTo(imageContentView.snp.bottom)
        }
        commentTableView.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(timeLabel.snp.bottom).offset(2)
            make.bottom.equalToSuperview().offset(-5)
            //如果cell高度确定直接tableView加载数据所以要写在setData前面
            setCommentAutoLayout()
        }
      

        
    }
    //设置评论列表自动布局内容及约束
    fileprivate func setCommentAutoLayout()  {
        storeNames = ["peter","peter"]
        commentArray = [
            ["name": "peter","toName":"HanMeimeie","connect":"HelloHelloHelloHelloHelloHelloHelloHello"],
            ["name": "peter","toName":"","connect":"Hello"],
            ["name": "peter","toName":"","connect":"Hello"],
            ["name": "peter","toName":"","connect":"Hello"],
            ["name": "peter","toName":"","connect":"Hello"],
            ["name": "peter","toName":"","connect":"Hello"]]
        let stringStore = storeNames.reduce("", { (a,b ) -> String in
            var result : String
            if a == ""{
                result = a + b
            }else{
                result = a + "," + b
            }
            return result
        })
        
        commentTableView.VM.storeNames = stringStore
        commentTableView.VM.commentArray = commentArray
        let storeHeight = heightByData(stringStore, fontSize: 11, width: SCREEN_WIDTH - 90)
        var commentAllHeight: CGFloat = 0
        for commentModel in commentArray {
            var stringComment = commentModel["name"]!
            if  commentModel["toName"] != ""{
                stringComment += "回复" + commentModel["toName"]!
            }
            stringComment += commentModel["connect"]!
            commentAllHeight +=  heightByData(stringComment, fontSize: 11, width: SCREEN_WIDTH-90)
        }
        commentTableView.snp.updateConstraints { (make) in
            make.height.equalTo(storeHeight + commentAllHeight)
        }

    }
    //UI数据设置
    func setData(_ userHeaderImage:String,userName:String,userMessage:String,imageUrls:[String]?) {
        userHeaderImageView.image = UIImage(named: userHeaderImage)
        timeLabel.text = "昨天"
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = UIColor.gray
        showItem.setImage(UIImage(named: "menu"), for: UIControlState())
        showItem.addTarget(self, action: #selector(FriendsTableViewCell.addItemView(_:)), for: .touchUpInside)
        userNameLabel.text = userName
        moreItem.contentHorizontalAlignment = .left
        moreItem.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        moreItem.setTitle("余下全文", for: UIControlState())
        moreItem.setTitleColor(UIColor.blue, for: UIControlState())
        userNameLabel.numberOfLines = 0
        userMessageLabel.numberOfLines = 0
        if userMessage.characters.count > 200 {
            self.moreItem.isHidden = false
            self.userMessage = userMessage
            userMessageLabel.text = userMessage.substring(to: userMessage.characters.index(userMessage.startIndex, offsetBy: 200)) + "  ......"
            moreItem.snp.updateConstraints{ (make) in
                make.height.equalTo(10)
            }
            moreItem.addTarget(self, action: #selector(FriendsTableViewCell.moreMessage(_:)), for: .touchUpInside)
        }else{
            userMessageLabel.text = userMessage
             self.moreItem.isHidden = true
        }
        userMessageLabel.font = UIFont.systemFont(ofSize: 12)
              //计算label高度
        let imageContentViewHeight = cellHeightByImageCount(imageUrls!.count)
        //添加高度约束 可以使cell高度自动改变 priorityHigh不会引起和cell的高度产生冲突
        imageContentView.snp.updateConstraints{ (make) in
            make.height.equalTo(imageContentViewHeight).priority(750)

        }
        let  imageWidth = (SCREEN_WIDTH - 70*2 - 10)/3
        for view in imageContentView.subviews{
            view.removeFromSuperview()
        }
        if let imageUrlsArray = imageUrls{
             for index in 0 ..< imageUrlsArray.count {
                let imageView = UIImageView(frame:CGRect(x: CGFloat(index%3)*(imageWidth+5), y: 5+CGFloat(index/3)*(imageWidth+5), width: imageWidth, height: imageWidth))
                OperationQueue.main.addOperation({
                    let url = URL(string: imageUrlsArray[index])
                    imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "headerImage"))
                })
                imageContentView.addSubview(imageView)
             }
        }

        
        
    }
    func removeSubView(_ sender:AnyObject?)  {
        delegate.removeSubView(10086)
    }
    func addItemView(_ sender:AnyObject?) {
        itemView.tag = 10086
        itemView.delegate = self
        if self.viewWithTag(10086) != nil{
            self.viewWithTag(10086)?.removeFromSuperview()
        }else{
            //代理方法移除tableView其他点赞评论view
            delegate.removeSubView(10086)
            //设置圆角
            itemView.layer.cornerRadius = 5
            self.addSubview(itemView)
            itemView.snp.makeConstraints { (make) in
                make.height.equalTo(24)
                make.width.equalTo(180)
                make.centerY.equalTo(showItem.snp.centerY)
                make.right.equalTo(showItem.snp.left).offset(-10)
            }
        }
        
    }
    //MARK: -- ItemViewDelegate
    func toStore() {
        if isStore{
            itemView.storeItem.setTitle("赞", for: UIControlState())
        }else{
            itemView.storeItem.setTitle("取消赞", for: UIControlState())
        }
        itemView.removeFromSuperview()
        isStore = !isStore
        self.commentTableView.reloadData()
    }
    func moreMessage(_ sender:AnyObject?)  {
        if !isMore{
            userMessageLabel.text = self.userMessage
            moreItem.setTitle("显示部分", for: UIControlState())
             self.delegate.updateTableView()
        }else{
            userMessageLabel.text = userMessage.substring(to: userMessage.index(userMessage.startIndex, offsetBy: 200)) + "......"
             moreItem.setTitle("余下全文", for: UIControlState())
             self.delegate.updateTableView()
        }
        isMore = !isMore
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
