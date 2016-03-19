//
//  EntranceCollectionLayout.swift
//  DiliDili
//
//  Created by yq on 16/3/18.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class EntranceCollectionLayout: UICollectionViewFlowLayout {
    
    var contentSize:CGSize?
    override func prepareLayout() {
//        self.itemSize = CGSizeMake(frameTool.screen_W()/4,frameTool.screen_W()/4)
//        self.minimumLineSpacing = 0
//        self.minimumInteritemSpacing = 0
//      var layoutArr = [[UICollectionViewLayoutAttributes]]()
//      var maxNumItems = 0
//      let numOfSection = (self.collectionView?.numberOfSections())! as Int
//      for var i = 0;i<numOfSection; ++i{
//        //获取到每个分区的item个数
//         let numberOfItems = self.collectionView?.numberOfItemsInSection(i)
//         var subArr = Array<UICollectionViewLayoutAttributes>()
//        for var j = 0 ;j<numberOfItems;++j{
//            let indexPath = NSIndexPath.init(forRow: j, inSection: i)
//            let attr = self.layoutAttributesForItemAtIndexPath(indexPath)
//            subArr.append(attr!)
//        }
//        if maxNumItems < numberOfItems{
//            maxNumItems = numberOfItems!
//        }
//        layoutArr.append(subArr)
//      }
//      
//        self.contentSize = CGSizeMake(maxNumItems*(self.itemSize.), <#T##height: CGFloat##CGFloat#>)
    }
    
    override func collectionViewContentSize() -> CGSize {
        return (self.collectionView?.bounds.size)!
    }
    
}
