//
//  swiftTool.swift
//  DiliDili
//
//  Created by yq on 16/3/7.
//  Copyright © 2016年 yq. All rights reserved.
//

import Foundation
import ObjectiveC


func swiftClassFromString(className: String) -> AnyClass! {
    //method1
    //方法 NSClassFromString 在Swift中已经不起作用了no effect，需要适当更改
    if  let appName: String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
        // generate the full name of your class (take a look into your "appname-swift.h" file)
        //            let classStringName = "_TtC\(appName!.utf16Count)\(appName!)\(count(className))\(className)"//xcode 6.1-6.2 beta
        let classStringName = "_TtC\(appName?.characters.count))\(appName!)\(appName?.characters.count)\(className)"
        let  cls: AnyClass? = NSClassFromString(classStringName)
        //  method2
        //cls = NSClassFromString("\(appName!).\(className)")
        assert(cls != nil, "class not found,please check className")
        return cls
        
    }
    return nil;
}





private var custom: String?
extension UIViewController {
    var pagesTitle: String? {
        get {
            return (objc_getAssociatedObject(self, &custom) as? String)!
        }
        set(newValue) {
            objc_setAssociatedObject(self, &custom, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}


