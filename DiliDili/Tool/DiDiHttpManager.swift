//
//  DiDiHttpManager.swift
//  DiliDili
//
//  Created by 姚琪 on 16/3/13.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit
import Alamofire
class DiDiHttpManager: NSObject {

    
    class func dd_GetNetWorkWithUrl(requestUrl:String?,paramDict:Dictionary<String,String>?,completions:(AnyObject? -> Void),fail:(NSError? -> Void)){
        Alamofire.request(.GET,requestUrl!,parameters:paramDict).responseJSON { response -> Void in
            
            let a = response.result
            if a.isSuccess {
               completions(a.value)
            }
            else{
                fail(a.error)
            }
            
        }
    }
}
