//
//  ViewController.swift
//  practice
//
//  Created by 船木勇斗 on 2022/10/30.
//

import UIKit

class ViewController: UIViewController {
    
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpGradation()
        setUpContentView()
        
       
        
        
    }
        
        func setUpGradation() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2)
            //gradientLayerの位置を設定
            
            gradientLayer.colors = [colors.bluePurple.cgColor, colors.blue.cgColor]
            //cgColor:UIcolorとはまた別の色の型
            //bluePurpleとblueのグラデーションを設定
            
            gradientLayer.startPoint = CGPoint.init(x: 0,y: 0)
            //方向の始点を設定
            
            gradientLayer.endPoint = CGPoint.init(x: 1,y: 1)
            //方向の終点を設定
            
            view.layer.insertSublayer(gradientLayer, at: 0)
            //CAGradientLayerはaddSubViewで載せることができないため、view.layerにinsertSublayer(子,at: 階層)として設定　＊atの数字が大きいほど前面にいく
    }
    
         func setUpContentView() {
            let contentView = UIView()
            contentView.frame.size = CGSize(width: view.frame.size.width, height: 340)//width:画面幅
            contentView.center = CGPoint(x: view.center.x, y: view.center.y)//真ん中に設定
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 30//角丸になるよう設定　*数字が大きいほど角丸
            contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
            //影の方向を設定。widthが大きいほど影が右に、heightが大きいほど下にいく
            contentView.layer.shadowOpacity = 0.5//影の透明度を設定。0に近いほど透明。
            view.addSubview(contentView)
    }

}

