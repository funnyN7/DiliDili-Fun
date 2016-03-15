//
//  ParseHelper.swift
//  DiliDili
//
//  Created by 姚琪 on 16/3/13.
//  Copyright © 2016年 yq. All rights reserved.
//
//JSON 解析类
import Foundation
extension NSObject{
    class  func objectWithKeyValues(keyValues:NSDictionary) -> AnyObject{
        let model = self.init()
        var outCount:UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder(), &outCount)
        for var i = 0; i < Int(outCount);i++ {
            let property = properties[i]
            let key = NSString(CString: property_getName(property), encoding: NSUTF8StringEncoding)
            let key_String = String(key)
            if let value = keyValues[key_String]{
                model.setValue(value, forKey: key_String)
            }
        }
        
        return model
}
    
    class func allProperties()-> Void{
        let className = NSString(CString: class_getName(self), encoding: NSUTF8StringEncoding)
        if let _ = NSString(CString: class_getName(self), encoding: NSUTF8StringEncoding){
            if className!.isEqualToString("NSObject"){
//                return nil
            }
        } else{
//                return nil
        }
//        var outCount:UInt32 = 0
        
//        var propertierArray = [DDProperty]()
//        
//        let propertier = class_copyPropertyList(self.classForCoder(), &outCount)
        
//        let superM = self.superclass()?.
//        if let _ = superM{
//            propertiesArray += superM!
//        }
    
    }
    
}

class DDProperty{
    
}

