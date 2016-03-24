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
class ZBViewController: UIViewController,DDBannerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //页面地址
    var downloadURL:String? = "http://live.bilibili.com/AppIndex/home?access_key=57807b3049d2b46d7cef9b4bdab6acda&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3010&device=phone&platform=ios&scale=2&sign=5590f7273181120e3ce5cf08edd51676&ts=1457690854"
    
    var entranceCollectionCellID = "entranceCollectionCellID"
    var entranceHeadID = "entranceHeadID"
    var entranceFootID = "entranceFootID"
    
    var elementCollectionCellID = "elementCollectionCellID"
    var elementHeadID = "elementHeadID"
    var elementFootID = "elementFootID"
    
    var bannerV:DDBannerView?
    
    var mainCollectionVC:UICollectionView?
    
    var dataHelper:LiveDataHelper = LiveDataHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.dilidili_RGBColor(190, G: 190, B: 190)
        self.title = "直播"
        self.createUI()
        
        DiDiHttpManager.dd_GetNetWorkWithUrl(self.downloadURL, paramDict: nil,
            completions:
            { (response) -> Void in
                self.dataHelper.orignialData = response
                self.dataHelper.configDataWithCompletion({ (state) -> Void in
                    if state==configState.configDataStateOK{
                        self.mainCollectionVC?.reloadData()
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
        let eLayout = UICollectionViewFlowLayout()
        eLayout.scrollDirection = .Vertical
        self.mainCollectionVC = UICollectionView(frame: CGRectMake(0, 0, frameTool.screen_W(), frameTool.screen_H()), collectionViewLayout: eLayout)
//        self.mainCollectionVC?.alwaysBounceVertical = true
        self.mainCollectionVC?.delegate = self
        self.mainCollectionVC?.dataSource = self
        self.mainCollectionVC?.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.mainCollectionVC!)
        
        self.mainCollectionVC?.registerClass(SpaceCollectionCell.classForCoder(), forCellWithReuseIdentifier: entranceCollectionCellID)
        self.mainCollectionVC?.registerClass(elementCollectionCell.classForCoder(), forCellWithReuseIdentifier:elementCollectionCellID)
        self.mainCollectionVC?.registerClass(DD_LiveCollectionViewBannerHeadView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: entranceHeadID)
        self.mainCollectionVC?.registerClass(DD_LiveCollectionViewBtnFootView.classForCoder(), forSupplementaryViewOfKind:UICollectionElementKindSectionFooter, withReuseIdentifier: entranceFootID)
        self.mainCollectionVC?.registerClass(DD_ElementHeadView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: elementHeadID)
        self.mainCollectionVC?.registerClass(DD_ElementFootView.classForCoder(), forSupplementaryViewOfKind:UICollectionElementKindSectionFooter, withReuseIdentifier: elementFootID)
        
        self.mainCollectionVC?.snp_makeConstraints(closure: { (make) -> Void in
            make.edges.equalTo(UIEdgeInsetsZero)
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func clickBannerWithIndex(clickIndex: Int) {
        print("点击了\(clickIndex)图片")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return (self.dataHelper.entranceData?.count)!
        }
        else{
            let arr = self.dataHelper.elementData![section-1]
            return arr.count
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1+(self.dataHelper.elementData?.count)!
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(entranceCollectionCellID, forIndexPath: indexPath) as! SpaceCollectionCell
       let enM = self.dataHelper.entranceData![indexPath.row]
        cell.imageName = enM.entrace_Icon!.src
        cell.title = enM.name
            return cell
        }
        else{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(elementCollectionCellID, forIndexPath: indexPath) as! elementCollectionCell
        let elementSubArr = self.dataHelper.elementData![indexPath.section-1]
        let eleM = elementSubArr[indexPath.row]
            cell.valueYz = (eleM.cover!.src!,(eleM.owner?.face)!,eleM.owner!.name!,eleM.title!,eleM.online)
            return cell
        }
        
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if indexPath.section == 0{
            if kind == UICollectionElementKindSectionHeader{
                let  bannerV = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: entranceHeadID, forIndexPath: indexPath) as! DD_LiveCollectionViewBannerHeadView
                bannerV.topBannerView?.configDataWithImageArray(self.dataHelper.bannerData)
                return bannerV
                
            }
            else{
                let  btnV = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: entranceFootID, forIndexPath: indexPath) as! DD_LiveCollectionViewBtnFootView
                btnV.focuLiverBtn?.addTarget(self, action: Selector("footBtnClick:"), forControlEvents: .TouchUpInside)
                btnV.liverCenterBtn?.addTarget(self, action: Selector("footBtnClick:"), forControlEvents: .TouchUpInside)
                btnV.searchBtn?.addTarget(self, action: Selector("footBtnClick:"), forControlEvents: .TouchUpInside)
                return btnV
            }
        }
        else{
            if kind == UICollectionElementKindSectionHeader{
                let  headV = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:elementHeadID, forIndexPath: indexPath) as! DD_ElementHeadView
                let titleM = self.dataHelper.elementTitltData![indexPath.section-1]
                headV.currentLiveLabelText = "123"
                headV.leftIconUrl = titleM.sub_icon?.src
                headV.sectionNameText = titleM.name
                return headV
            }
                
            else{
                 let  footV = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:elementFootID, forIndexPath: indexPath) as! DD_ElementFootView
                footV.countBtn?.setTitle("2条动态,点击刷新!", forState: .Normal)
                return footV
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeMake(frameTool.screen_W(), 60)
        }
        else{
            return CGSizeMake(frameTool.screen_W(), 65)
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeMake(frameTool.screen_W(), 120)
        }
        else{
             return CGSizeMake(frameTool.screen_W(), 40)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSizeMake(frameTool.screen_W()/4, frameTool.screen_W()/4)
        }
        else{
            return CGSizeMake(frameTool.screen_W()/2, 150)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("惦记了\(indexPath)")
    }
    
    func footBtnClick(btn:UIButton)->Void{
        print("tag\(btn.tag)")
        print("\(self.mainCollectionVC?.contentSize)")
    }
    
}
