//
//  ViewController.swift
//  DiliDili
//
//  Created by yq on 16/3/2.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {

     var container:DAPagesContainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.createContainer()
        
    }

    func createContainer() {
        self.container = DAPagesContainer.init()
        let zb = ZBViewController()
        let re = RecommendViewController()
        let fj = FJViewController()
        let fq = FQViewController()
        zb.pagesTitle = "直播"
        re.pagesTitle = "推荐"
        fj.pagesTitle = "番剧"
        fq.pagesTitle = "分区"
        self.container?.view.frame = CGRectMake(0, 20, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-20-49)
        self.container?.topBarHeight = 44
        self.container?.topBarItemLabelsFont = UIFont.systemFontOfSize(14)
        self.container?.pageItemsTitleColor = UIColor.darkGrayColor()
        self.container?.topBarBackgroundColor = UIColor.whiteColor()
        self.container?.selectedPageItemTitleColor = UIColor.dilidiliThemeColor()
        self.view.addSubview((self.container?.view)!)
        self.container?.viewControllers = [zb,re,fj,fq]    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

