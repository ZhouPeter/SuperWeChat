//
//  PageViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 2016/9/26.
//  Copyright © 2016年 周. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController ,UIPageViewControllerDataSource,UIPageViewControllerDelegate{
    var firstViewController: MailListViewController!
    var secondViewController: PageSecondViewController!
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: [UIPageViewControllerOptionInterPageSpacingKey:1])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        firstViewController = MailListViewController()
        secondViewController = PageSecondViewController()
        
        self.delegate = self
        self.dataSource = self
        if let startVC = self.viewControllerAtIndex(0){
            self.setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        var index : Int
        if viewController is MailListViewController{
             index = (viewController as! MailListViewController).index
        }else{
            index = (viewController as! PageSecondViewController).index

        }
        index -= 1
        let VC = viewControllerAtIndex(index)
        return VC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        var index : Int
        if viewController is MailListViewController{
            index = (viewController as! MailListViewController).index
        }else{
            index = (viewController as! PageSecondViewController).index
            
        }
        index += 1
        let VC = viewControllerAtIndex(index)
        return VC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("滑动了")
    }
    
    
    
    func viewControllerAtIndex(_ index:Int) -> UIViewController?{
        if index == 0{
            let VC = MailListViewController()
            VC.index = index
            return VC
        }else if index == 1{
            let VC = PageSecondViewController()
            VC.index = index
            return VC
        }
        return nil
    }
    

    


}

