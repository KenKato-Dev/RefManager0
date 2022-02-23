//
//  ViewController.swift
//  RefManager0
//
//  Created by 加藤研太郎 on 2022/01/19.
//

import UIKit

//プロトコル追加、ITableViewDelegate、UITableViewDataSource
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    let foods = FoodService.shared
    //ここが間違っている、
//    let boxButton = ListCell().box
    @IBOutlet weak var removeButton: RemoveButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
//        boxButton?.setImage(CheckBoxButton().emptyBox, for: .normal)
        // Do any additional setup after loading the view.
//        table.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "cell")
//        foods.getfoods().sort()
        removeButton.addTarget(self, action: #selector(removeFunc(_:)), for: .touchUpInside)
        
    }
//viewが表示される直前に呼ばれる、表示系ライフサイクルメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    //リストの数を設定、返す数がCellの数になる
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //下記が1行のみの場合はreturn省略可能
        
        return foods.getfoods().count
    }
    //リスト内に表示するテキスト設定
    //ここが作動せず
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //リスト内のCellを下記定数で取得し、返したものをCellとして表示(アンラップ？)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ListCell
        //セクション表示用
        
       
        //cellテキスト左側
//        cell.textLabel?.text = "test" /
        cell.LeftCellLabel?.text = foods.getfoods()[indexPath.row].name
        //cellテキスト右側
//        cell.detailTextLabel?.text = "test"
        cell.RightCellLabel?.text = String(foods.getfoods()[indexPath.row].number)
        //ボタンを入れる
//        cell.box = foods.getfoods()[indexPath.row].button
        //ボタンのアクション
//        cell.box.addTarget(self, action: #selector(selectBox(_:)), for: .touchUpInside)
//        if indexPath.row == pushedRow{
//            cell.box.setImage(CheckBoxButton().checkedBox, for: .normal)
//        }else{
//            cell.box.setImage(CheckBoxButton().emptyBox, for: .normal)
//        }
        
        return cell
    }
//セクション表示(空配列ではできない？　fatal error:Index out of range)
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        foods.indexMake()[section]
//    }
    //IndexBar設定
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        foods.indexMake()
    }
    
    //タッチされた箇所のIndexPathが入りタップした先に移動する
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        self.table.scrollToRow(at: [0,index], at: .top, animated: true)
        return index
    }
    //削除ボタンの機能
    @objc func removeFunc(_ sender: UIButton){
        RemoveButton().toggle()
        table.reloadData()
        if RemoveButton.isPushed == true{
            removeButton.setTitle("削除", for: .normal)
            removeButton.setTitleColor(UIColor.orange, for: .normal)
            print(RemoveButton.isPushed)
        }else{
            removeButton.setImage(removeButton.dustBox, for: .normal)
            removeButton.setTitleColor(UIColor.gray, for: .normal)
            print(RemoveButton.isPushed)
        }
        print("削除ボタンが押されました")
    }
}

