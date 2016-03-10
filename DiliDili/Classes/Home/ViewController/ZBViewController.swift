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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        // Do any additional setup after loading the view.
        self.title = "直播"
        
        self.createUI()
    }
    
    func createUI(){
        let bannnerImage = UIImage(named:"main_banner")
        let headImageView = UIImageView(image: bannnerImage)
        self.view.addSubview(headImageView)
        headImageView.snp_makeConstraints { (make) -> Void in
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
