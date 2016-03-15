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
import Kingfisher
class ZBViewController: UIViewController {
    
    //页面地址
    var downloadURL:String? = "http://live.bilibili.com/AppIndex/home?access_key=57807b3049d2b46d7cef9b4bdab6acda&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3010&device=phone&platform=ios&scale=2&sign=5590f7273181120e3ce5cf08edd51676&ts=1457690854"
    
    var bannerImage:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.dilidili_RGBColor(190, G: 190, B: 190)
        self.title = "直播"
        self.createUI()
        
        DiDiHttpManager.dd_GetNetWorkWithUrl(self.downloadURL, paramDict: nil,
            completions:
            { (response) -> Void in
               let liveHelper = LiveDataHelper()
                liveHelper.orignialData = response
                liveHelper.configDataWithCompletion({ (state) -> Void in
                    if state==configState.configDataStateOK{
                        let bannerM = ((liveHelper.bannerSource?.first)!)! as DD_LiveBannerModel
                        
                        self.bannerImage?.kf_setImageWithURL(NSURL(string: bannerM.img!)!)
                    }
                    else if state==configState.configDataStateDataError{
                        
                    }
                    else{
                        
                    }
                })
            })
            { (requestError) -> Void in
               
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
            make.height.equalTo(150*(320/frameTool.screen_W()))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
