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


}

