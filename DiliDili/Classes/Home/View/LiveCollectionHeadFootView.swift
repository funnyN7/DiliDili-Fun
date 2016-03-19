//
//  LiveCollectionHeadFootView.swift
//  DiliDili
//
//  Created by yq on 16/3/18.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class DD_LiveCollectionViewBannerHeadView: UICollectionReusableView {
    
    var topBannerView:DDBannerView?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.dilidili_LightGrayColor()
        self.topBannerView = DDBannerView(src: nil, frame: CGRectZero)
        self.addSubview(self.topBannerView!)
        self.topBannerView?.snp_makeConstraints(closure: { (make) -> Void in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, -15, 0))
        })
        
}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DD_LiveCollectionViewBtnFootView: UICollectionReusableView {
    
    var focuLiverBtn:UIButton?
    var liverCenterBtn:UIButton?
    var searchBtn:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.dilidili_LightGrayColor()
        
        self.focuLiverBtn = UIButton(type: .Custom)
        self.liverCenterBtn = UIButton(type: .Custom)
        self.searchBtn = UIButton(type: .Custom)
        self.focuLiverBtn?.tag = 1
        self.liverCenterBtn?.tag = 2
        self.searchBtn?.tag = 3
        self.focuLiverBtn?.setBackgroundImage(UIImage(named: "home_bangumi_category"), forState:.Normal)
        self.liverCenterBtn?.setBackgroundImage(UIImage(named: "home_bangumi_timeline"), forState:.Normal)
        self.searchBtn?.setBackgroundImage(UIImage(named: "home_bangumi_recommend"), forState:.Normal)
        self.addSubview(self.focuLiverBtn!)
        self.addSubview(self.liverCenterBtn!)
        self.addSubview(self.searchBtn!)
        
        let eachWidth = (frameTool.screen_W()-40)/3
        self.focuLiverBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(10)
            make.width.equalTo(eachWidth)
            make.bottom.equalTo(-15)
            make.top.equalTo(15)
        })
        
        self.liverCenterBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo((self.focuLiverBtn?.snp_right)!).offset(10)
            make.width.equalTo(eachWidth)
            make.bottom.equalTo(-15)
            make.top.equalTo(15)
        })
        
        self.searchBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo((self.liverCenterBtn?.snp_right)!).offset(10)
            make.width.equalTo(eachWidth)
            make.bottom.equalTo(-15)
            make.top.equalTo(15)
        })
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class DD_ElementHeadView:UICollectionReusableView{
    private var leftIcon:UIImageView?
    var leftIconUrl:String?{
        didSet{
            self.leftIcon?.kf_setImageWithURL(NSURL(string: self.leftIconUrl!)!)
        }
    }
    private var sectionName:UILabel?
    var sectionNameText:String?{
        didSet{
            self.sectionName?.text = self.sectionNameText
        }
    }
    private var currentLiveLabel:UILabel?
    var currentLiveLabelText:String?{
        didSet{
            self.currentLiveLabel?.text = self.currentLiveLabelText
        }
    }
    private var rightIcon:UIImageView?
    var  coverControl:UIControl?
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.leftIcon = UIImageView()
        self.sectionName = UILabel()
        self.currentLiveLabel = UILabel()
        self.rightIcon = UIImageView()
        self.coverControl = UIControl()
        
        self.sectionName?.font = UIFont.systemFontOfSize(15)
        self.currentLiveLabel?.font = UIFont.systemFontOfSize(14)
        self.sectionName?.textColor = UIColor.darkTextColor()
        self.currentLiveLabel?.textColor = UIColor.dilidili_LightGrayColor()
        
        self.sectionName?.textAlignment = .Left
        self.currentLiveLabel?.textAlignment = .Right
        self.rightIcon?.backgroundColor = UIColor.dilidili_LightGrayColor()
        
        self.addSubview(self.leftIcon!)
        self.addSubview(self.sectionName!)
        self.addSubview(self.currentLiveLabel!)
        self.addSubview(self.rightIcon!)
        self.addSubview(self.coverControl!)
        
        
        self.leftIcon?.snp_makeConstraints(closure: { (make) -> Void in
             make.left.equalTo(10)
             make.centerY.equalTo(self.snp_centerY).offset(-2.5)
             make.size.equalTo(CGSizeMake(20, 20))
        })
        
        self.rightIcon?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo(-10)
            make.centerY.equalTo((self.leftIcon?.snp_centerY)!)
            make.size.equalTo(CGSizeMake(25, 25))
        })
        
        self.currentLiveLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo((self.rightIcon?.snp_left)!).offset(-10)
            make.width.greaterThanOrEqualTo(1)
            make.height.equalTo(25)
        })
        
        self.sectionName?.snp_makeConstraints(closure: { (make) -> Void in
            make.centerY.equalTo((self.leftIcon?.snp_centerY)!)
            make.left.equalTo((self.leftIcon?.snp_right)!).offset(10)
            make.right.greaterThanOrEqualTo((self.currentLiveLabel?.snp_left)!).offset(-10)
            make.height.equalTo(25)
        })
        
        self.coverControl?.snp_makeConstraints(closure: { (make) -> Void in
            make.edges.equalTo(UIEdgeInsetsZero)
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DD_ElementFootView: UICollectionReusableView {
    
    var moreBtn:UIButton?
    var countBtn:UIButton?
    var refreshBtn:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.dilidili_LightGrayColor()
        
        let sView = UIView()
        sView.backgroundColor = UIColor.whiteColor()
        self.addSubview(sView)
        self.moreBtn = UIButton(type: .Custom)
        self.countBtn = UIButton(type: .Custom)
        self.refreshBtn = UIButton(type: .Custom)
        self.moreBtn?.setTitleColor(UIColor.dilidili_RGBColor(160, G: 160, B: 160), forState: .Normal)
        self.moreBtn?.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.moreBtn?.layer.borderWidth = 0.5
        self.moreBtn?.titleLabel?.font = UIFont.systemFontOfSize(16)
        self.moreBtn?.setTitle("查看更多", forState: .Normal)
        
        self.countBtn?.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.countBtn?.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
        self.countBtn?.titleLabel?.textAlignment = .Right
        
        self.refreshBtn?.backgroundColor = UIColor.dilidiliThemeColor()
        sView.addSubview(self.moreBtn!)
        sView.addSubview(self.countBtn!)
        sView.addSubview(self.refreshBtn!)
        
        
        sView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, -15, 0))
        }
        
        let moreBtnWidth = frameTool.screen_W()/2-20
        self.moreBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.bottom.equalTo(sView.snp_bottom).offset(-10)
            make.width.equalTo(moreBtnWidth)
        })
        
        self.refreshBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo(-10)
            make.size.equalTo(CGSizeMake(12, 12))
            make.centerY.equalTo(sView)
        })
        
        self.countBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo((self.refreshBtn?.snp_left)!).offset(-10)
            make.height.equalTo(15)
            make.width.greaterThanOrEqualTo(1)
            make.centerY.equalTo(sView.snp_centerY)
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


