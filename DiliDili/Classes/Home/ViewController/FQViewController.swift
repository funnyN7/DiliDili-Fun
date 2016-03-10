//
//  FQViewController.swift
//  DiliDili
//
//  Created by yq on 16/3/9.
//  Copyright © 2016年 yq. All rights reserved.
//

import UIKit

class FQViewController: UIViewController {
    
    var clv:UICollectionView?
    var clvDataSource:[FQModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        // Do any additional setup after loading the view.
        
        self.fillData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillData(){
        self.clvDataSource = Array()
        
    }
}
