//
//  DDBannerView.swift
//  DiliDili
//
//  Created by yq on 16/3/17.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

protocol DDBannerViewDelegate{
    func clickBannerWithIndex(clickIndex:Int)
}

class DDBannerView: UIView,UIScrollViewDelegate,UIGestureRecognizerDelegate{

    var indicateView:UIPageControl?
    private var srcView:UIScrollView?
    var imageURLArray:Array<DD_LiveBannerModel>?
    var autoReFresh:Bool = true
    var delegate:DDBannerViewDelegate?
    init(src:Array<DD_LiveBannerModel>?, frame:CGRect){
        self.imageURLArray = src
        super.init(frame:frame)
        if src != nil{
        self.createUI()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  configDataWithImageArray(imageArr:Array<DD_LiveBannerModel>?)->Void{
        if (self.imageURLArray != nil){
            for sub  in self.subviews{
             sub.removeFromSuperview()
            }
            self.imageURLArray = imageArr
            self.createUI()
        }
        else{
        self.imageURLArray = imageArr
        self.createUI()
        }
    }
    func  createUI()->Void{
        guard let _ = self.imageURLArray else{
            fatalError("imageURLArray can not be empty")
        }
        self.autoReFresh = self.imageURLArray?.count == 1
        if self.autoReFresh {
            self.createImageView()
        }
        else{
            self.createSrcView()
        }
    }
    
    func createImageView()->Void{
        let bannerM = self.imageURLArray?.first
        let imageV = UIImageView()
        imageV .kf_setImageWithURL(NSURL(string: (bannerM!.img)!)!, placeholderImage:UIImage.dilidiliDefaultImage())
        self.addSubview(imageV)
        imageV.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(self.snp_size)
            make.left.equalTo(0)
            make.top.equalTo(0)
        }
        let ges = UIGestureRecognizer(target:self, action:"clickImage:")
        imageV.userInteractionEnabled = true
        imageV.addGestureRecognizer(ges)
    }
    
    func clickImage(ges:UIGestureRecognizer)->Void{
        self.delegate?.clickBannerWithIndex(0)
    }
    
    func createSrcView()->Void{
        self.srcView = UIScrollView(frame: self.bounds)
        self.srcView?.delegate = self
        self.srcView?.backgroundColor = UIColor.whiteColor()
        self.srcView?.showsHorizontalScrollIndicator = false
        self.srcView?.showsVerticalScrollIndicator = false
        self.srcView?.pagingEnabled = true
        self.srcView?.bounces = false
        self.addSubview(self.srcView!)
        
        self.indicateView = UIPageControl()
        self.indicateView?.pageIndicatorTintColor = UIColor.whiteColor()
        self.indicateView?.currentPageIndicatorTintColor = UIColor.dilidiliThemeColor()
        self.indicateView?.currentPage = 0
        
        self.indicateView?.numberOfPages = (self.imageURLArray?.count)!
        
        for bm in self.imageURLArray!{
            let imageView = UIImageView()
            imageView.tag = (self.imageURLArray?.indexOf(bm))!
            imageView.kf_setImageWithURL(NSURL(string: bm.img!)!, placeholderImage: UIImage.dilidiliDefaultImage())
            self.srcView?.addSubview(imageView)
            let offsetX = CGFloat(imageView.tag)*(self.srcView?.dd_Width())! as CGFloat
            imageView.snp_makeConstraints(closure: { (make) -> Void in
                make.leftMargin.equalTo((self.srcView?.snp_leftMargin)!).offset(offsetX)
                make.top.equalTo((self.srcView?.snp_top)!)
                make.size.equalTo((self.srcView?.snp_size)!)
            })
            let ges = UIGestureRecognizer.init(target: self, action:Selector("srcClickImage:"))
            imageView.userInteractionEnabled = true
            imageView.addGestureRecognizer(ges)
        }
        let width = CGFloat((self.imageURLArray?.count)!)*self.dd_Width()
        self.srcView?.contentSize = CGSizeMake(width, self.dd_Height())
        self.addSubview(self.indicateView!)
        self.indicateView?.snp_makeConstraints(closure: { (make) -> Void in
            make.right.equalTo(-20)
            make.bottom.equalTo(-20)
            let width = CGFloat(15*(self.imageURLArray?.count)!)
            make.size.equalTo(CGSizeMake(width, 30))
        })
    }
    
    func srcClickImage(ges:UIGestureRecognizer)->Void{
        let superV = ges.view
        self.delegate?.clickBannerWithIndex((superV?.tag)!)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.indicateView?.currentPage = Int((scrollView.contentOffset.x))/Int((self.srcView?.dd_Width())!)
    }
}
