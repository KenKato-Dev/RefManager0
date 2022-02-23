//
//  RemoveButton.swift
//  RefManager0
//
//  Created by 加藤研太郎 on 2022/02/22.
//

import UIKit

class RemoveButton:UIButton{
    let dustBox = UIImage(systemName: "trash")!
    static var isPushed = false
    
    static let sharedRemoveButton : RemoveButton = RemoveButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customDesign()
      }
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customDesign()
      }
      
      override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        customDesign()
      }
    private func customDesign(){
        setImage(dustBox, for: .normal)
        // マスク適用
        layer.masksToBounds = true
        // 角丸み
//        layer.cornerRadius = 15.0
        // 枠線の色
//        layer.borderColor = UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0).cgColor
        // 枠線の太さ
//        layer.borderWidth = 2
        // Padding
//        contentEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        // 背景色
        backgroundColor = UIColor.white
        // テキスト色
        setTitleColor(UIColor.red, for: .normal)
//        setTitleColor(UIColor(displayP3Red: 79/255, green: 172/255, blue: 254/255,alpha: 1.0), for: .normal)
        // テキストサイズ
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        imageView?.image?.withTintColor(.red)
    }
    func toggle(){
        //トグルの中でisCheckを入れ替えるようにしてImageを連携させる
        RemoveButton.isPushed.toggle()
        ListCell().appearSelectButton()
    }
}
