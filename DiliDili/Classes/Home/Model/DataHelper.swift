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
   private var bannerSource:Array<DD_LiveBannerModel>?
    var bannerData:Array<DD_LiveBannerModel>?{
        get{
            if self.bannerSource == nil{
                self.bannerSource = [DD_LiveBannerModel]()
            }
            return self.bannerSource
        }
        set(value){
            self.bannerSource = value
        }
    }
    
    private var cateGorySource:Array<DD_LiveCateGoryModel>?
    var entranceData:Array<DD_LiveCateGoryModel>?{
        get{
            if self.cateGorySource == nil{
                self.cateGorySource = [DD_LiveCateGoryModel]()
            }
            return self.cateGorySource
        }
        set(value){
            self.cateGorySource = value
        }
    }
   

    private var partitionTitleSource:Array<DD_LivePartitionModel>?
    var elementTitltData:Array<DD_LivePartitionModel>?{
        get{
            if self.partitionTitleSource == nil{
                self.partitionTitleSource = [DD_LivePartitionModel]()
            }
            return self.partitionTitleSource
        }
        set(value){
            self.partitionTitleSource = value
        }
    }
    private var elementSource:Array<Array<DD_LiveElementModel>>?
    var elementData:Array<Array<DD_LiveElementModel>>?{
        get{
            if self.elementSource == nil{
                self.elementSource = [[DD_LiveElementModel]]()
            }
            return self.elementSource
        }
        set(value){
            self.elementSource = value
        }
    }
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
            
            for element in banner!{
                let bannerM = DD_LiveBannerModel()
                bannerM.setValuesForKeysWithDictionary(element)
                self.bannerData?.append(bannerM)
            }
            
            //entrance
            let entrance = data!.objectForKey("entranceIcons") as! Array<AnyObject>
            
            for element in entrance{
                let entranceM = DD_LiveCateGoryModel()
                 entranceM.setValuesForKeysWithDictionary(element as! [String : AnyObject])
                let dictElement = element as! Dictionary<String,AnyObject>
                let enDict = dictElement["entrance_icon"] as! Dictionary<String,AnyObject>
                let entranceSubM = DD_LiveCateGorySubModel()
                entranceSubM.setValuesForKeysWithDictionary(enDict)
                entranceM.entrace_Icon = entranceSubM
                self.entranceData?.append(entranceM)
            }
            
            //partitions
            let partitions = data!.objectForKey("partitions") as! Array<AnyObject>
            for count in 0..<partitions.count{
                let partDict = partitions[count] as! Dictionary<String,AnyObject>
                let parttionDict = partDict["partition"] as? Dictionary<String,AnyObject>
                let parttionSubDict = parttionDict!["sub_icon"] as? Dictionary<String,AnyObject>
                let elementArr = partDict["lives"] as! Array<AnyObject>
                
                let partM  = DD_LivePartitionModel()
                partM.setValuesForKeysWithDictionary(parttionDict!)
                let partSubM = DD_LivePartitionSubModel()
                partSubM.setValuesForKeysWithDictionary(parttionSubDict!)
                partM.sub_icon = partSubM
                self.elementTitltData?.append(partM)
                
                var sectionElementArr = [DD_LiveElementModel]()
                for count in 0..<elementArr.count{
                    let liveDict = elementArr[count]
                    let liveM = DD_LiveElementModel()
//                    print("\(liveDict["room_id"])")
                    liveM.setValuesForKeysWithDictionary(liveDict as! [String : AnyObject])
//                    liveM.room_id = liveDict["room_id"] as? Int
//                    liveM.online = liveDict["online"] as? Int
                    let ownerDict = liveDict["owner"] as? Dictionary<String,AnyObject>
                    let coverDict = liveDict["cover"] as? Dictionary<String,AnyObject>
                    let ownerM = DD_LiveElementOwnerModel()
                    ownerM.setValuesForKeysWithDictionary(ownerDict!)
                    let coverM = DD_LiveElementCoverModel()
                    coverM.setValuesForKeysWithDictionary(coverDict!)
                    liveM.owner = ownerM
                    liveM.cover = coverM
                    sectionElementArr.append(liveM)
                }
                self.elementData?.append(sectionElementArr)
            }
            
            completion(.configDataStateOK)
                        
            
        }
        
    }
}