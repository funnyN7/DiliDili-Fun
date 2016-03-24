//
//  DD_BMGBannerModel.swift
//  DiliDili
//
//  Created by yq on 16/3/24.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class DD_BMGBannerModel:DD_BaseModel{
  var title:String?
  var link:String?
  var img:String?
  var simg:String?
  var aid:Int?
  var type:String?
  var platform:Int?
  var pid:Int?
}

class DD_BMGCatalogyModel:DD_BaseModel{
  var aid:String?
  var title:String?
  var subtitle:String?
  var play:Int?
  var review:Int?
  var video_review:Int?
  var favorites:Int?
  var mid:Int?
  var author:String?
  var des:String?
  var create:String?
  var pic:String?
  var coins:Int?
  var duration:String?
  var badgepay:Int?
  var pts:Int?
}

class DD_BMGRecommendModel:DD_BMGCatalogyModel{
 
}
