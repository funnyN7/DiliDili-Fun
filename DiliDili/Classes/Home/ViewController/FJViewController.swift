//
//  FJViewController.swift
//  DiliDili
//
//  Created by yq on 16/3/9.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class FJViewController: UIViewController {
  
    var requestURl = "http://app.bilibili.com/api/region_ios/13.json?access_key=9f06f10986fb1b761cd8131f94ff5cd4&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3060&device=phone&platform=ios&sign=46bf21a876c590f56c2709293691e21d&ts=1458810940"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view.
        self.title = "番剧"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
