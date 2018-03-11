//
//  CalenderViewController.swift
//  calender
//
//  Created by 上田　護 on 2018/01/08.
//  Copyright © 2018年 上田　護. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController {
    var textLabel: UILabel!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //スクリーンの幅
        let screenWidth = Int( UIScreen.main.bounds.size.width);
        
        //スクリーンの高さ
        let screenHeight = Int(UIScreen.main.bounds.size.height);
        
        //CGRectで取得
        let rect = UIScreen.main.bounds;

        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: screenWidth/2,height: screenHeight/2))
        
        // 背景をオレンジ色にする.
        myLabel.backgroundColor = UIColor.orange
        
        // 枠を丸くする.
        myLabel.layer.masksToBounds = true
        
        // コーナーの半径.
        myLabel.layer.cornerRadius = 20.0
        
        // Labelに文字を代入.
        myLabel.text = "Hello Swift!!"
        
        // 文字の色を白にする.
        myLabel.textColor = UIColor.white
        
        // 文字の影の色をグレーにする.
        myLabel.shadowColor = UIColor.gray
    
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.center
        
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)

        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.cyan

        // Font設定
        myLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        
        // ViewにLabelを追加.
        
        self.view.addSubview(myLabel)
    }
    
//    init() {
//        super.init(coder: CGRectZero)
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
