//
//  FoodService.swift
//  RefManager0
//
//  Created by 加藤研太郎 on 2022/01/23.
//

import Foundation
import UIKit

struct Food{
//    let nameAndNumber:(name:String, number:Int)
    let name:String
    let number:Int
}


class FoodService{
    
    //クラス変数(静的変数)：クラスで定義された変数でインスタンスで枝分かれされない、クラスで唯一の変数でこれは全てのファイル内で同期される
    static let shared : FoodService = FoodService()
    
    
    private var foods:[Food] = []
    
    
    func add(_ food:Food){
        foods.append(food)
//        print(foods)
    }
    //保存した内容を読み込む、
    func getfoods() -> [Food] {
        foods
    }
    func sort(){
        do{
            try foods.sort(by: { lhs, rhs in
//                return true
                lhs.name < rhs.name
            })
        }catch{
//            fatalError()
        }
    }
}
