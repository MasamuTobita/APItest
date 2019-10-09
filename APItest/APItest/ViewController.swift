//
//  ViewController.swift
//  APItest
//
//  Created by 高梨健 on 2019/10/07.
//  Copyright © 2019 飛田真武. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var Titletext: UILabel!
    @IBOutlet weak var UserIDtext: UILabel!
    @IBOutlet weak var Numbertext: UILabel!
    //    var articles: [[String: String?]] = [] // 記事を入れるプロパティを定義
    
    func pri (a: Int){
        Alamofire.request("https://qiita.com/api/v2/items").responseJSON {
            res in
            if res.result.isSuccess {
                guard let returnValue = res.result.value else{
                    return
                }
                let json = JSON(returnValue)
//                json.forEach { (a, json) in
                    self.Titletext.text = json[a]["title"].string
                    self.UserIDtext.text = json[a]["user"]["id"].string
//                }
            } else {
                print("Error!")
            }
            self.Numbertext.text = a.description
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        Alamofire.request("https://qiita.com/api/v2/items").responseJSON {
//            res in
//            if res.result.isSuccess {
//                guard let returnValue = res.result.value else{
//                    return
//                }
//                let json = JSON(returnValue)
//                json.forEach { (_, json) in
//                    let article: [String: String?] = [
//                        "title": json["title"].string,
//                        "userId": json["user"]["id"].string
//                    ] // 1つの記事を表す辞書型を作る
////                    self.articles.append(article) // 配列に入れる
//                }
////                print(self.articles) // 全ての記事が保存出来たら配列を確認
//            } else {
//                print("Error!")
//            }
//        }
    }
    
    @IBAction func Button1(_ sender: UIButton) {
        pri (a: 1)
    }
    @IBAction func Button2(_ sender: UIButton) {
        pri (a: 2)
    }
    @IBAction func Button3(_ sender: UIButton) {
        pri (a: 3)
    }
    @IBAction func Button4(_ sender: UIButton) {
        pri (a: 4)
    }
    @IBAction func Button5(_ sender: UIButton) {
        pri (a: 5)
    }
    @IBAction func Button6(_ sender: UIButton) {
        pri (a: 6)
    }
    @IBAction func Button7(_ sender: UIButton) {
        pri (a: 7)
    }
    @IBAction func Button8(_ sender: UIButton) {
        pri (a: 8)
    }
    @IBAction func BUtton9(_ sender: UIButton) {
        pri (a: 9)
    }
    @IBAction func Button10(_ sender: UIButton) {
        pri (a: 10)
    }
    

}
