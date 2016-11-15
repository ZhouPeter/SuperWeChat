//
//  SearchResultsViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/9/19.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    //搜索数据源
    var allData : [[String:String]] = [
        ["image":"donostia","title":"1111微信","message":"微信你好","time":"下午6:30"],["image":"donostia","title":"微信","message":"微信你好","time":"下午6:30"],["image":"donostia","title":"111微信","message":"微信你好","time":"下午6:30"],["image":"donostia","title":"微信","message":"微信你好","time":"下午6:30"]
    ]
    var searchResult :[[String:String]]  = [[:]]
    var testTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(testTableView)
        self.testTableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(-44)
            
        }
        testTableView.delegate = self
        testTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //搜索方法
    func searchFilter( _ textToSearch: String){
        searchResult = allData.filter({ (s) -> Bool in
            var textToSearchNew = textToSearch
            textToSearchNew = textToSearchNew.lowercased()
            let nameBool  = s["title"]?.contains(textToSearchNew)
            return nameBool!
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return searchResult.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell  = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = searchResult[indexPath.row]["title"]
        return  cell
        
    }

}
