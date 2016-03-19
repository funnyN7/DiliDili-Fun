//
//  LiveModel.swift
//  DiliDili
//
//  Created by yq on 16/3/11.
//  Copyright © 2016年 yq. All rights reserved.
//

import Foundation

class DD_BaseModel:NSObject{
    override func setNilValueForKey(key: String) {
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}

class  DD_LiveBannerModel:DD_BaseModel {
    var title:String?
    var img:String?
    var remark:String?
    var link:String?
}

class DD_LiveCateGoryModel:DD_BaseModel{
    var id:Int?
    var name:String?
    var entrace_Icon:DD_LiveCateGorySubModel?
}

class DD_LiveCateGorySubModel:DD_BaseModel{
    var src:String?
    var height:String?
    var width:String?
}

class DD_LivePartitionModel:DD_BaseModel{
    var id:Int?
    var name:String?
    var area:String?
    var sub_icon:DD_LivePartitionSubModel?
    var count:Int?
}

class DD_LivePartitionSubModel:DD_BaseModel{
    var src:String?
    var height:String?
    var width:String?
}


class DD_LiveElementModel:DD_BaseModel{
    var title:String?
    var room_id:NSNumber?
    var online:NSNumber?
    var owner:DD_LiveElementOwnerModel?
    var cover:DD_LiveElementCoverModel?
}

class DD_LiveElementOwnerModel:DD_BaseModel{
    var face:String?
    var mid:Int32?
    var name:String?
}

class DD_LiveElementCoverModel:DD_BaseModel{
    var src:String?
    var height:Int32?
    var width:Int32?
}

