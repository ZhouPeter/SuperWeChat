
//
//  SearchController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit
//自定义SearchController协议
protocol CustomSearchControllerDelegate:NSObjectProtocol {
    func didStartSearching()
    
    func didTapOnSearchButton()
    
    func didTapOnCancelButton()
    
    func didChangeSearchText(searchText: String)
}
//controller协议
protocol CustomSearchControllerToControllerDelegate :NSObjectProtocol {
    func tabBarHidden()
    
}
//view协议
@objc protocol CustomSearchControllerToViewDelegate :NSObjectProtocol {
    func addDefaultView(view :SearchDefaultTableView)
    func removeDefaultView(view :SearchDefaultTableView)
    @objc optional func clearTextField()
    func becomeActive()
}


class SearchControllerViewModel: NSObject,UISearchResultsUpdating,UISearchControllerDelegate,UISearchBarDelegate {
    //控制器属性
    weak var target : WeChatSearchViewController!
    //view代理属性
    weak var viewDelegate:CustomSearchControllerToViewDelegate!
    //controller代理属性
    weak var controllerDelegate:CustomSearchControllerToControllerDelegate!
    //自定义代理
    weak var customDelegate:CustomSearchControllerDelegate!

    //懒加载 默认第一张view
    lazy var firstDefaultView:SearchDefaultTableView = {
        let defaultTableView = SearchDefaultTableView(frame: self.target.controllerTarget.view.frame, style: .plain)
        defaultTableView.controllerTarget = self.target
        return defaultTableView
    }()
    
  
    //MARK: --UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController){
        let resultVC = searchController.searchResultsController as! SearchResultsViewController
        if var textToSearch = searchController.searchBar.text{
            //去除空格
            textToSearch = textToSearch.trimmingCharacters(in: CharacterSet.whitespaces)
            resultVC.searchFilter(textToSearch)
        }
        resultVC.testTableView.reloadData()
    }

    //MARK: -- UISearchControllerDelegate

    func willPresentSearchController(_ searchController: UISearchController) {
        self.controllerDelegate.tabBarHidden()
        self.viewDelegate.addDefaultView(view: firstDefaultView)
        //添加毛玻璃效果
        addOrRemoveBlur(target: target.controllerTarget, style: .extraLight, size: SCREEN_SIZE)
    }
    func willDismissSearchController(_ searchController: UISearchController) {
        self.controllerDelegate.tabBarHidden()
        viewDelegate.removeDefaultView(view: firstDefaultView)
        //移除毛玻璃效果
        addOrRemoveBlur(target: target.controllerTarget)

    }
    //MARK: -- UISearchBarDelegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.customDelegate.didStartSearching()
        print("begin")

    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.customDelegate.didTapOnSearchButton()
        print("search")
    }
     func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        searchBar.text = ""
        searchBar.resignFirstResponder()
        print("cancel")
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        self.viewDelegate.becomeActive()
        print("语音开始..........")
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        print("shouldBegin")
        return true
    }

    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
        let contentString : String = searchBar.text!
        let newRange = range.toRangeByString(content: contentString)
        let string = contentString.replacingCharacters(in: newRange , with: text)
        print(string)
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText != "" {
           self.viewDelegate.removeDefaultView(view: firstDefaultView)
        }else{
           self.viewDelegate.addDefaultView(view: firstDefaultView)
        }
    }
    

        
    
}
