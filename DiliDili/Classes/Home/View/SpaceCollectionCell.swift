//
//  spaceCollectionCell.swift
//  DiliDili
//
//  Created by yq on 16/3/11.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class SpaceCollectionCell: UICollectionViewCell {
    
    private var image:UIImageView?
    private var label:UILabel?
     var title:String?{
        didSet{
            label?.text = title!
        }
}
    
     var imageName:String?{
        didSet{
            image?.kf_setImageWithURL(NSURL(string: imageName!)!, placeholderImage: nil)
        }
}
    override init(frame:CGRect){
        super.init(frame: frame)
        self.image = UIImageView()
        self.label = UILabel()
        self.contentView.addSubview(self.image!)
        self.contentView.addSubview(self.label!)
        
        let leftEdge = (self.contentView.dd_Width()-40)/2
        self.image?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(leftEdge)
            make.top.equalTo(15)
            make.size.equalTo(CGSizeMake(40, 40))
        })
        self.label?.snp_makeConstraints(closure: { (make) -> Void in
            make.centerX.equalTo((self.image?.snp_centerX)!)
            make.height.equalTo(20)
            make.topMargin.equalTo((self.image?.snp_bottomMargin)!).offset(25)
        })
    }
  
    convenience init(name:String?){
        self.init(name:name)
    }
    
//    convenience
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
}



class elementCollectionCell: UICollectionViewCell {
    
    private var image:UIImageView?
    private var nameLabel:UILabel?
    private var countLabel:UILabel?
    private var titleLabel:UILabel?
    private var icon:UIImageView?
    var valueYz:(imageUrl:String,iconUrl:String,name:String,title:String,count:NSNumber?){
        didSet{
            image?.kf_setImageWithURL(NSURL(string: valueYz.imageUrl)!, placeholderImage: nil)
            nameLabel?.text = valueYz.name
            countLabel?.text = String(valueYz.count!)
            titleLabel?.text = valueYz.title
            icon?.kf_setImageWithURL(NSURL(string: valueYz.iconUrl)!, placeholderImage: nil)
        }
    }
    
    override init(frame:CGRect){
        self.valueYz = ("","","","",0)
        super.init(frame: frame)
        self.image = UIImageView()
        self.nameLabel = UILabel()
        self.countLabel = UILabel()
        self.titleLabel = UILabel()
        self.icon = UIImageView()
        self.image?.layer.cornerRadius = 5
        self.image?.layer.masksToBounds = true
        self.countLabel?.backgroundColor = UIColor.dilidili_RGBColor(200, G: 200, B: 200)
        //SNP
        let sView = UIView()
        sView.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(sView)
        sView.addSubview(self.image!)
        sView.addSubview(self.nameLabel!)
        sView.addSubview(self.countLabel!)
        sView.addSubview(self.titleLabel!)
        sView.addSubview(self.icon!)
        sView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(UIEdgeInsetsMake(5, 10, -5, -5))
        }
        
        self.image?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(100)
        })
        
        self.icon?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(5)
            make.topMargin.equalTo((self.image?.snp_bottomMargin)!).offset(0)
            make.size.equalTo(CGSizeMake(35, 35))
        })
        self.icon?.layer.cornerRadius = 17.5
        self.icon?.layer.borderWidth = 2
        self.icon?.layer.masksToBounds = true
        self.icon?.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.countLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.leftMargin.equalTo((self.icon?.snp_leftMargin)!)
            make.width.equalTo((self.icon?.snp_width)!)
            make.height.equalTo(15)
            make.top.equalTo((self.icon?.snp_bottom)!).offset(10)
            
        })
        
        self.nameLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo((self.icon?.snp_right)!).offset(5)
            make.top.equalTo((self.image?.snp_bottom)!).offset(5)
            make.height.equalTo(20)
            make.right.equalTo(0)
        })
        
        self.titleLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo((self.nameLabel?.snp_left)!)
            make.top.equalTo((self.nameLabel?.snp_bottom)!).offset(5)
            make.height.equalTo(18)
            make.right.equalTo(0)
        })
        
        self.nameLabel?.font = UIFont.systemFontOfSize(15)
        self.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.countLabel?.font = UIFont.systemFontOfSize(11)
        self.nameLabel?.textColor = UIColor.darkTextColor()
        self.titleLabel?.textColor = UIColor.lightGrayColor()
        self.countLabel?.textColor = UIColor.darkGrayColor()
        
        self.countLabel?.textAlignment = .Center
        self.nameLabel?.textAlignment = .Left
        self.titleLabel?.textAlignment = .Left
    }
    
    
    //    convenience
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    
}



