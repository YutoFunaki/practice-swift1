//
//  ViewController.swift
//  practice
//
//  Created by 船木勇斗 on 2022/10/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiview = UIView()
        uiview.frame.size = CGSize(width: 200, height: 200)
        uiview.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        uiview.backgroundColor = .systemIndigo
        view.addSubview(uiview)
        
        let uiview2 = UIView()
        uiview2.frame.size = CGSize(width: 150, height: 150)
        uiview2.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        uiview2.backgroundColor = .cyan
        uiview.addSubview(uiview2)
    }


}

