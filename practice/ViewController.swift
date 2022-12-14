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
        
        setUpImageButton("chat", x: view.frame.size.width - 50).addTarget(self, action: #selector(chatAction), for: .touchDown)
        //returnでUIButtonを呼び出し元に返しているので、呼び出し元のsetUpImageButton()はUIButtonと同等に扱うことができる
        //addTarget: 「ボタンを押したときに呼び出す関数」や、「押した時か、離した時か」などのタイミングを設定する
        //selfはクラスであるviewControllerを指している
        //#selector: 関数名を書くのだが＠objcとついたもの限定
        //.touchDown: ボタンを押したタイミングで関数が呼ばれるよう設定
        setUpImageButton("reload", x: 10).addTarget(self, action: #selector(reloadAction), for: .touchDown)
        
        let imageView = UIImageView()
        //UIImageViewインスタンスを作る
        let image = UIImage(named: "virus")
        imageView.image = image
        //UIImageViewインスタンスのimageプロパティにUIImageを代入する
        imageView.frame = CGRect(x: view.frame.size.width, y: -65, width: 50, height: 50)
        //UIImageViewインスタンスの位置とサイズを決める
        //CGRectの引数xで画面幅の値を指定し、画面外から入ってくるアニメーションにするために画面外に画像を配置している
        contentView.addSubview(imageView)
        //addSubViewでUIImageインスタンスを表示させる
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseIn], animations: {
            imageView.frame = CGRect(x: self.view.frame.size.width - 100, y: -65, width: 50,
                height: 50)
            imageView.transform = CGAffineTransform(rotationAngle: 90)
        }, completion: nil)
        //アニメーションを表現するための設定
        //UIView.animateのwithDurationはアニメーション時間、delayはコードが読まれてからのタイムラグ、optionはアニメーションスタイル、animations:{}が変化させたい値をアニメーションで表現する領域。
        //CGRect: 画面外にあった画像を0.5秒のタイムラグと1.5秒のアニメーションで、画面幅-100の位置に移動させるよう設定
        //transform: サイズや位置を変化させるプロパティ。今回はCGAffineTransformのrotationAngelによって、画像を-90度回転させている。アニメーションがついているため画面を開くと自動的に変換が動的に変わり、回転しながら画面内に移動する。
        //completion: まだ
    }
    
    func setUpImageButton(_ name: String, x: CGFloat) -> UIButton {
        //->UIButton: 呼び出し元にUIButtonを返す書き方
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: name), for: .normal)
        //setImage: ボタンのアイコンを設定するためのメソッド named: ファイル名 for: ボタンの状態
        button.frame.size = CGSize(width: 30, height: 30)
        button.tintColor = .white
        //設定した画像の色を変える設定
        button.frame.origin = CGPoint(x: x, y: 25)
        //ボタンのx座標とy座標を設定
        view.addSubview(button)
        return button
        //UIButtonを呼び出し元に返している
    }
    @objc func reloadAction() {
        loadView()
        viewDidLoad()
        //更新するためのシステムが既にUIViewControllerにあるので、それを読み込むための文(ライフサイクル)
    }
    @objc func chatAction() {
        print("タップchat")
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

