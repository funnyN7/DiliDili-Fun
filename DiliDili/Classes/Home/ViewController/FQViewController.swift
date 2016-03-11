//
//  FQViewController.swift
//  DiliDili
//
//  Created by yq on 16/3/9.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class FQViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var clv:UICollectionView?
    var clvDataSource:[FQModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        // Do any additional setup after loading the view.
        self.createUI()
        self.fillData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createUI(){
        self.clv = UICollectionView(frame: CGRectMake(0, 0, frameTool.screen_W(), frameTool.screen_H()-64-49), collectionViewLayout: UICollectionViewFlowLayout())
        self.clv?.backgroundColor = UIColor.whiteColor()
        self.clv?.dataSource = self
        self.clv?.delegate = self
        
    }
    
    func fillData(){
        self.clvDataSource = Array()
        
    }
    
    
    //delegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        var cc = UICollectionViewCell()
        return cc
    }
}
