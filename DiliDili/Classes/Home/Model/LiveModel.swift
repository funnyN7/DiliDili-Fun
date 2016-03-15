//
//  LiveModel.swift
//  DiliDili
//
//  Created by yq on 16/3/11.
//  Copyright © 2016年 yq. All rights reserved.
//

import Foundation


class  DD_LiveBannerModel:NSObject {
    var title:String?
    var img:String?
    var remark:String?
    var link:String?
}

class DD_LiveCateGoryModel:NSObject{
    var id:Int?
    var name:String?
    var entrace_icon:[DD_LiveCateGorySubModel?]?
}

class DD_LiveCateGorySubModel:NSObject{
    var src:String?
    var height:String?
    var width:String?
}

class DD_LivePartitionModel:NSObject{
    var id:Int?
    var name:String?
    var area:String?
    var sub_icon:[DD_LivePartitionSubModel?]?
    var count:Int?
}

class DD_LivePartitionSubModel:NSObject{
    var src:String?
    var height:String?
    var width:String?
}


class DD_LiveElementModel:NSObject{
    var title:String?
    var room_id:Int32?
    var online:Int32?
    var owner:[DD_LiveElementOwnerModel?]?
    var cover:[DD_LiveElementCoverModel?]?
}

class DD_LiveElementOwnerModel:NSObject{
    var face:String?
    var mid:Int32?
    var online:Int32?
}

class DD_LiveElementCoverModel:NSObject{
    var title:String?
    var room_id:Int32?
    var online:Int32?
}

