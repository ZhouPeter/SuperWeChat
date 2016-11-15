//
//  FriendsViewController.swift
//  SuperWeChat
//
//  Created by 周鹏杰 on 16/8/23.
//  Copyright © 2016年 周. All rights reserved.
//


import UIKit
class FriendsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var friendsTableView =  FriendsTableView()
    var  showImage:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        friendsTableView.controllerTarget = self
        self.view.addSubview(friendsTableView)
        friendsTableView.snp.remakeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        self.addBarButtonItem()
        self.setNavigationTitle(friendsTitle)
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true

    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     添加barItem
     */
    func addBarButtonItem() {
        let imageCamera = UIImage(named: "Camera")
        let rightItem = UIBarButtonItem(image: imageCamera, style: .done, target: self, action: #selector(FriendsViewController.showSheet(_:)))
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    /**
     sheet展示
     
     - parameter sender: 按钮本身
     */
    func showSheet(_ sender: AnyObject?) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //取消
        let actionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        //相册
        let actionPhotoLibray = UIAlertAction(title: "相册中选择图片", style: .default) { (UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
                
            }
            
        }
        //相机
        let actionCamera = UIAlertAction(title: "相机拍摄", style: .default) { (UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        }
        
        alert.addAction(actionPhotoLibray)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        //alert的dismiss恢复原来状态有所不同
        self.present(alert, animated: true,completion: nil)
    }
    //选择图片回调
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.showImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
        
    }
    //Use imagePickerController:didFinishPickingMediaWithInfo: instead.
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage,  editingInfo: [String : AnyObject]?) {
//            self.showImage = image
//            dismissViewControllerAnimated(true, completion: nil)
//    }

    


}


