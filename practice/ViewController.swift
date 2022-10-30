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
       
        
        let uiView = UIView()
        uiView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        uiView.backgroundColor = UIColor.systemBlue
        view.addSubview(uiView)
    }


}

