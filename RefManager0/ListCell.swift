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
//    static var nib: UINib {
//            return UINib(nibName: "ListCell.swift", bundle: nil)
//        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
