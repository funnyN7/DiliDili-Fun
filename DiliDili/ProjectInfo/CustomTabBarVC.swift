//
//  CustomTabBarVC.swift
//  DiliDili
//
//  Created by yq on 16/3/2.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit
class CustomTabBarVC: UITabBarController {
    var appName:String? = NSBundle.mainBundle().infoDictionary!["CFBundleName"]! as? String
    private var titleArray:[String?] = ["首页","关注","发现","我的"]
    private var imageArray:[String?] = ["home_normal","focus_normal","find_normal","mine_normal"]
    private var imageSelectArray:Array<String>? = ["home_select","focus_select","find_select","mine_select"]
    private var classArr:[String?]?
    private var itemArray:[UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createContentVCS()
    }
    
    
    func  createContentVCS(){
        for index in 0...3{
            let title = titleArray[index]
            let imageNormal_Name = imageArray[index]
            let imageSelect_Name = imageSelectArray![index]
            let imageNormal = UIImage(named:imageNormal_Name!)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let imageSelect = UIImage(named: imageSelect_Name)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let tabItem:UITabBarItem = UITabBarItem(title:title,image:imageNormal,selectedImage:imageSelect)
            let normal_dic = NSDictionary(object: UIColor.darkGrayColor(),
                forKey:   NSForegroundColorAttributeName)
            let select_dic = NSDictionary(object: UIColor.dilidiliThemeColor(),
                forKey:   NSForegroundColorAttributeName)
            tabItem .setTitleTextAttributes(normal_dic as? [String : AnyObject], forState: UIControlState.Normal)
            tabItem .setTitleTextAttributes(select_dic as? [String : AnyObject], forState: UIControlState.Selected)
            let vc:UIViewController
            switch index{
            case 0: vc = HomeViewController()
            case 1: vc = FocusViewController()
            case 2: vc = FindViewController()
            default:vc = MineViewController()
            }
            let navc:UINavigationController = UINavigationController(rootViewController: vc)
            vc.view.backgroundColor = UIColor.whiteColor()
            vc.tabBarItem = tabItem
            self.itemArray.append(navc)
        }
        self.viewControllers = self.itemArray
    }
    
    
}
