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
        setUpContent()
        
        
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
    
    func setUpContent() {
        let contentView = UIView()
        contentView.frame.size = CGSize(width: view.frame.size.width, height: 340)//width:画面幅
        contentView.center = CGPoint(x: view.center.x, y: view.center.y)//真ん中に設定
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 30//角丸になるよう設定　*数字が大きいほど角丸
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        //影の方向を設定。widthが大きいほど影が右に、heightが大きいほど下にいく
        contentView.layer.shadowOpacity = 0.5//影の透明度を設定。0に近いほど透明。
        view.addSubview(contentView)
        
        view.backgroundColor = .systemGray6//下半分の画面をグレーにする
        
        let labelFont = UIFont.systemFont(ofSize: 15, weight: .heavy)//heavy: 文字を太くする
        let size = CGSize(width: 150, height: 50)
        let color = colors.bluePurple
        let leftX = view.frame.size.width * 0.33
        let rightX = view.frame.size.width * 0.80
        //フォントやサイズ、座標を一括で変更できるように定数で設定する
        setUpLabel("Covid in Japan",
                   size: CGSize(width: 180, height: 35),
                   centerX: view.center.x - 20, y: -60,
                   font: .systemFont(ofSize: 25, weight: .heavy),
                   color: .white, contentView)
        //親要素をcontentview(真ん中の白い四角)にすることで端末が変わってもcontentviewの上60の位置に表示される
        setUpLabel("PCR数", size: size, centerX: leftX, y: 20, font: labelFont, color: color, contentView)
        setUpLabel("感染者数", size: size, centerX: rightX, y: 20, font: labelFont, color: color, contentView)
        setUpLabel("入院者数", size: size, centerX: leftX, y: 120, font: labelFont, color: color, contentView)
        setUpLabel("重傷者数", size: size, centerX: rightX, y: 120, font: labelFont, color: color, contentView)
        setUpLabel("死者数", size: size, centerX: leftX, y: 220, font: labelFont, color: color, contentView)
        setUpLabel("退院者数", size: size, centerX: rightX, y: 220, font: labelFont, color: color, contentView)
        //contentview: UIView()
        
        let height = view.frame.size.height / 2
        setUpButton("健康管理", size: size, y: height + 190, color: colors.blue, parentView: view)
        setUpButton("県別状況", size: size, y: height + 240, color: colors.blue, parentView: view)
        //y: contentviewが340のheightを持ち、画面中央に配置しているため、画面中央(view.frame.size.height/ 2) + contentView　の半分の高さ170よりも20下に行く190、70下に行く240として、常にcontentViewの下にボタンが配置されるようにしている。
        
    }
    
    func setUpButton(_ title: String, size: CGSize, y: CGFloat, color: UIColor, parentView: UIView){
        let button = UIButton(type: .system)//.system: タップした時に明るくなる機能
        button.setTitle(title, for: .normal)
        //UIButtonにタイトルをつけるための文。「title」が名前になる。　for:.normalはボタンが選択された状態の設定
        button.frame.size = size
        button.center.x = view.center.x
        //center.x: そのパーツの中心のx座標を取得している。この場合は、buttonの中心を画面の中心に設定している
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.kern: 8.0])
        //NSAttributeString: 文字同士の感覚を設定している。枠をつけたりすることもできる
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.frame.origin.y = y
        button.setTitleColor(color, for: .normal)//UIButtonの色を変更
        parentView.addSubview(button)
    }
    
    
    // _: 引数の省略
    func setUpLabel(_ text: String, size: CGSize, centerX: CGFloat, y: CGFloat, font: UIFont, color: UIColor,_ parentView: UIView){
        let label = UILabel()
        label.text = text
        label.frame.size = size
        label.center.x = centerX
        label.frame.origin.y = y
        label.font = font
        label.textColor = color
        parentView.addSubview(label)
    }

}

