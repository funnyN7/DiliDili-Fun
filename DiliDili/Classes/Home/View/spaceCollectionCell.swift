//
//  spaceCollectionCell.swift
//  DiliDili
//
//  Created by yq on 16/3/11.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class spaceCollectionCell: UICollectionViewCell {
    
    private var image:UIImageView?
    private var label:UILabel?
     var title:String?{
        didSet{
            label?.text = title!
        }
}
    
     var imageName:String?{
        didSet{
            image?.image = UIImage(named: imageName!)
        }
}
    override init(frame:CGRect){
        super.init(frame: frame)
    }
  
    convenience init(name:String?){
        self.init(name:"")
    }
    
//    convenience
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
}



