//
//  ZBViewController.swift
//  DiliDili
//
//  Created by yq on 16/3/9.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
class ZBViewController: UIViewController {
    
    //页面地址
    var downloadURL:String! = "http://live.bilibili.com/AppIndex/home?access_key=57807b3049d2b46d7cef9b4bdab6acda&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3010&device=phone&platform=ios&scale=2&sign=5590f7273181120e3ce5cf08edd51676&ts=1457690854"
    
    var bannerImage:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        // Do any additional setup after loading the view.
        self.title = "直播"
        self.createUI()
        
        Alamofire.request(.GET,downloadURL,parameters:nil).responseJSON { response -> Void in
            
           let a = response.result.value?.objectForKey("data")
            
           let bannerInfo  = a?.objectForKey("banner")![0] as! Dictionary<String,String>
            
           let bannerModel = DD_LiveBannerModel()
            
            bannerModel.img = bannerInfo["img"]
            
            self.bannerImage?.image = UIImage(named: bannerModel.img!)
            
        }
    }
    
    func createUI(){
        let bannnerImage1 = UIImage(named:"main_banner")
         bannerImage = UIImageView(image: bannnerImage1)
        self.view.addSubview(bannerImage!)
        bannerImage!.snp_makeConstraints { (make) -> Void in
//            make.left.top.right.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(100*(320/frameTool.screen_W()))
        }
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
