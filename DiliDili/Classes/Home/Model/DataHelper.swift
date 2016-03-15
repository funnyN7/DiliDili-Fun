//
//  DataHelper.swift
//  DiliDili
//
//  Created by 姚琪 on 16/3/13.
//  Copyright © 2016年 yq. All rights reserved.
//

import Foundation

enum configState{
    case configDataStateOK  //正常解析
    case configDataStateError //解析出现错误
    case configDataStateDataError //数据状态不对
    
}

public var DD_code = "code"
public var DD_message = "message"
public var DD_data = "data"




class basicDataHelper{
    //原始数据 因为不知道类型，所以类型为AnyObject
    var  orignialData:AnyObject?
    
    var  message:String?
    //共同处理数据方法
    func configDataWithCompletion(completion:(configState -> Void)){
        let rCode =  self.orignialData?.objectForKey(DD_code) as! Int
        if rCode==0{
            completion(.configDataStateOK)
        }
        else{
            completion(.configDataStateDataError)
        }
    }
}


class LiveDataHelper:basicDataHelper{
    //顶部数据
    var bannerSource:Array<DD_LiveBannerModel?>?
    var cateGorySource:Array<DD_LiveCateGoryModel>?
    var partitionTitleSource:Array<DD_LivePartitionModel>?
    var elementSource:Array<DD_LiveElementModel?>?
    
    override func configDataWithCompletion(completion: (configState -> Void)){
        super.configDataWithCompletion { state -> Void in
            guard state==configState.configDataStateOK else{
                   completion(state)
                   return
            }
            //总数据
            let data = self.orignialData?.objectForKey(DD_data)
            //banner
            let banner = data!.objectForKey("banner") as? Array<Dictionary<String,String>>
            
            self.bannerSource = [DD_LiveBannerModel]()
            self.cateGorySource = [DD_LiveCateGoryModel]()
            self.partitionTitleSource = [DD_LivePartitionModel]()
            self.elementSource = [DD_LiveElementModel]()
            for element in banner!{
                let bannerM = DD_LiveBannerModel()
                bannerM.setValuesForKeysWithDictionary(element)
                self.bannerSource?.append(bannerM)
            }
            completion(.configDataStateOK)
                        
            
        }
        
    }
}