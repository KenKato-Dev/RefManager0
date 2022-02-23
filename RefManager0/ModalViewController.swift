//
//  ModalViewController.swift
//  RefManager0
//
//  Created by 加藤研太郎 on 2022/01/22.
//

import UIKit

class ModalViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var preserveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//文字列入力時に数字だけ入れられるようにする
        rightTextField.keyboardType = UIKeyboardType.numberPad
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        // Do any additional setup after loading the view.
//textFieldの処理をこのViewControllerに移譲する
        leftTextField.delegate = self
        
    }

//保存ボタンのアクション
    @IBAction func onPreserve(_ sender: Any) {
        addToList()
        FoodService.shared.sort()
        dismiss(animated: true, completion: nil)
//        addToList()
//        performSegue(withIdentifier: "tableView", sender: nil)
        
    }
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//保存
     func addToList(){
         let newFood = Food.init(name: leftTextField.text!, number:Int(rightTextField.text!)!)
         FoodService.shared.add(newFood)

//         ViewController().table.reloadData()
         
    }
    
//Enterキーでキーボードを下げる
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
//画面外をタップするとキーボードを下げる、要delegate
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
