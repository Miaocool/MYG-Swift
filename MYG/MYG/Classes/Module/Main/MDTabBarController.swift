//
//  MDTabBarController.swift
//  MYG
//
//  Created by Apple on 16/8/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class MDTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
}
// MARK: - 初始化
extension MDTabBarController {
    
    private func initUI(){
        
        addChildViewController(HomeViewController(), image: "", title: "")
        addChildViewController(NewsannounceController(), image: "", title: "")
        addChildViewController(SunorderViewController(), image: "", title: "")
        addChildViewController(BuylistController(), image: "", title: "")
        addChildViewController(MeViewController(), image: "", title: "")
   
    }
    private func initData() {
        
    }
    /**
     初始化控制器
     
     - parameter childController: 子控制器
     - parameter image:           defult 图片
     - parameter title:           选中图片
     */
    private func addChildViewController(childController: UIViewController, image: String, title: String) {
        
        childController.tabBarItem.title = title
        childController.tabBarItem.image = UIImage(named: image)
        childController.tabBarItem.selectedImage = UIImage(named: image + "")
        let nav = MDNavigationController(rootViewController: childController)
        self.addChildViewController(nav)
    }
}
