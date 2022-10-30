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
        let size = view.frame.size
        let uiview = UIView()
        uiview.frame.size = CGSize(width: 100, height: 100)
        uiview.center = CGPoint(x: size.width / 2, y: size.height / 2)
        uiview.backgroundColor = UIColor.systemBlue
        view.addSubview(uiview)
    }


}

