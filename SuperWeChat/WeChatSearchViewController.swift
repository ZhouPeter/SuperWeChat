//
//  WeChatSearchController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit



class WeChatSearchViewController: UISearchController,CustomSearchControllerToViewDelegate,CustomSearchControllerDelegate{
    var customSearchBar: CustomSearchBar!
    let VM  = SearchControllerViewModel()
    weak var controllerTarget : WeChatViewController!
    deinit {
        print("回收咯")
    }
    
    init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchBarTintColor: UIColor) {
        super.init(searchResultsController: searchResultsController)
        configureSearchBar(frame: searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchBarTintColor)
        self.setSearchBar()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //设置textField
    func setSearchBar(){
        if let index = indexOfSearchFieldInSubviews() {
            // 获取搜索输入框
            let searchField: UITextField = (searchBar.subviews[0]).subviews[index] as! UITextField
            searchField.placeholder = "请输入搜索内容"
        }
        //设置bookMarkButton图标
        self.searchBar.showsBookmarkButton = true
        self.searchBar.setImage(UIImage(named:"voice"), for: .bookmark, state: .normal)
        self.searchBar.barTintColor = RGB(r: 201, g: 201, b: 206)
        self.searchBar.searchBarStyle = .default
        self.searchBar.tintColor = RGB(r: 38, g: 202, b: 114)

    }
    //获取textField索引
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = searchBar.subviews[0]
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i] is UITextField {
                index = i
                break
            }
        }
        return index
    }
    //初始化自定义searchBar
    func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
        customSearchBar = CustomSearchBar(frame: frame, font: font , textColor: textColor)
        customSearchBar.placeholder = "Search in this awesome bar..."
        customSearchBar.barTintColor = bgColor
        customSearchBar.tintColor = textColor
        customSearchBar.showsBookmarkButton = true
        customSearchBar.showsCancelButton = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        VM.target = self
        //设置控制器
        self.setSearchController()
        //设置Bar视图的颜色
        self.setSearchBar()
        //搜索结果更新者为当前控制器
        self.setDelegate()
    }
    func setSearchController(){
        //搜索时，背景变暗色
        self.dimsBackgroundDuringPresentation = false
        //搜索是背景变模糊
        if #available(iOS 9.1, *) {
            self.obscuresBackgroundDuringPresentation = false
        } else {
            // Fallback on earlier versions
        }
        //设置背景色
        self.view.backgroundColor = UIColor.clear
    }

    func setDelegate(){
        self.searchResultsUpdater = VM
        self.delegate = VM
        self.searchBar.delegate = VM
        self.customSearchBar.delegate = VM
        VM.viewDelegate = self
        VM.customDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: -- CustomSearchControllerToViewDelegate
    func addDefaultView(view :SearchDefaultTableView){
        self.view.addSubview(view)
    }
    func removeDefaultView(view :SearchDefaultTableView){
        view.removeFromSuperview()
    }
    
    func becomeActive(){
        self.isActive = true
    }
    
    //MARK: -- CustomSearchControllerDelegate
    func didStartSearching(){
        print("开始")
    }
    
    func didTapOnSearchButton(){
        print("搜索")
    }
    
    func didTapOnCancelButton(){
        print("取消")
    }

    
    func didChangeSearchText(searchText: String){
        print("正在输入\(searchText)")
    }


}
