//
//  ListCell.swift
//  RefManager0
//
//  Created by 加藤研太郎 on 2022/01/28.
//

import UIKit

class ListCell: UITableViewCell {
    ///@IBOutlet〜UILabel！によってStoryboardのAutolayoutが作動するため＝UILabelとすると変数が作動する形から外れ、
    ///中に入っているUIの情報が反映されなくなってしまう
    
    @IBOutlet weak var LeftCellLabel :UILabel!
    @IBOutlet weak var RightCellLabel:UILabel!
    @IBOutlet weak var box: CheckBoxButton!
    

    
    //    static var nib: UINib {
//            return UINib(nibName: "ListCell.swift", bundle: nil)
//        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code　ここに初期値を設定、ViewControllerで実装せず余計なものを入れないことで自動でボタンが各Cellに入る
        //ボタンのアクション
        
        box.addTarget(self, action: #selector(selectBox(_:)), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func selectBox(_ sender: UIButton) {

        box.toggle()
        var boxClick = 0
        if box.isCheck == false {
            box.setImage(box.emptyBox, for: .normal)
            boxClick += 1
            print("□です")
        }else{
            box.setImage(box.checkedBox, for: .normal)
            boxClick += 1
            print("☑︎です")
        }
        
        print("\(box.tag+1)番目のボタンが\(boxClick)回押されました")

    }
    func appearSelectButton(){
        var sharedRemove = RemoveButton.isPushed
        if sharedRemove == true{
            box.isHidden = false
            print("test")
        }else{
            box.isHidden = true
            print("test")
        }
    }
}
