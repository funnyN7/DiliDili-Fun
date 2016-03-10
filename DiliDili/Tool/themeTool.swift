//
//  themeTool.swift
//  DiliDili
//
//  Created by yq on 16/3/9.
//  Copyright © 2016年 yq. All rights reserved.
//

import Foundation


extension UIColor {
    
    
  class  func  dilidiliThemeColor() -> UIColor {
        return UIColor.init(colorLiteralRed: 247/255.0, green: 145/255.0, blue: 164/255.0, alpha: 1)
    }
}

extension UIView{
    
    func  dd_x()->CGFloat{
        return CGRectGetMinX(self.frame)
    }
    func dd_y()->CGFloat{
        return CGRectGetMinY(self.frame)
    }
    func dd_Width()->CGFloat{
        return CGRectGetWidth(self.frame)
    }
    func dd_Height()->CGFloat{
        return CGRectGetHeight(self.frame)
    }
    func dd_MaxX()->CGFloat{
        return CGRectGetMaxX(self.frame)
    }
    func dd_MaxY()->CGFloat{
        return CGRectGetMaxY(self.frame)
    }
    func dd_centerX()->CGFloat{
        return CGRectGetMidX(self.frame)
    }
    func dd_centerY()->CGFloat{
        return CGRectGetMidY(self.frame)
    }
    func dd_center()->CGPoint{
        return CGPointMake(self.dd_centerX(), self.dd_centerY())
    }
    
    func dd_setX(value:CGFloat) -> Void{
        self.frame.origin.x = value
    }
    func dd_setY(value:CGFloat) -> Void{
        self.frame.origin.y = value
    }
    func dd_setW(value:CGFloat) -> Void{
        self.frame.size.width = value
    }
    func dd_setH(value:CGFloat) -> Void{
        self.frame.size.height = value
    }
    func dd_setMax(value:CGFloat) -> Void{
        self.frame.size.height = value
    }
    func dd_setCenterX(value:CGFloat) -> Void{
        self.center.x = value
    }
    func dd_setCenterY(value:CGFloat) -> Void{
        self.center.y = value
    }
    func dd_setCenter(value:CGPoint) -> Void{
        self.center = value
    }
}


class frameTool {
  class  func screen_W () -> CGFloat{
        return UIScreen.mainScreen().bounds.size.width
    }
  class  func screen_H () -> CGFloat{
        return UIScreen.mainScreen().bounds.size.height
    }
}

