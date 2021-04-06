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
    
//    func pri (a: Int){
//        Alamofire.request("https://qiita.com/api/v2/items").responseJSON {
//            res in
//            if res.result.isSuccess {
//                guard let returnValue = res.result.value else{
//                    return
//                }
//                let json = JSON(returnValue)
//                    self.Titletext.text = json[a]["title"].string
//                    self.UserIDtext.text = json[a]["user"]["id"].string
//            } else {
//                print("Error!")
//            }
//            self.Numbertext.text = a.description
//        }
//    }
    
    func pri (a: Int){
        let url = URL(string: "https://pbl-app1-api.appspot.com/Lookin/posts/" + a.description)!
                Alamofire.request(url, method: .get).responseJSON { response in
                    switch response.result {
                    case .success:
                        let resData:JSON = JSON(response.result.value ?? kill)
//                        resData.forEach { (_, resData) in
//
//                        }
                        self.Titletext.text = resData["created_at"]["Time"].string
                        self.UserIDtext.text = resData["user_id"].int?.description
                    case .failure(let error):
                        print(error)
                    }
                    self.Numbertext.text = a.description
                }
    }
    
    func post(a:Int){
        let parameters:[String : Any] = [
                "user_id": 1,
                "restaurant_id": 2,
                "image": "test.jpg",
                "genre": "food",
                "comment": "美味しかったです" + a.description
            ]
        
        Alamofire.request("https://pbl-app1-api.appspot.com/Lookin/posts/",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                if let result = response.result.value as? [String: Any] {
                    print(result["id"]!)
                }
        }
    }
    
//    func pri (a: Int){
//        let url = URL(string: "http://150.95.156.155/users/1")!
//        Alamofire.request(url, method: .get).responseJSON { response in
//            switch response.result {
//            case .success:
//                let resData:JSON = JSON(response.result.value ?? kill)
//                self.Titletext.text = resData["user_information"][a-1]["name"].string
//                self.UserIDtext.text = resData["user_information"][a-1]["height"].int?.description
//            case .failure(let error):
//                print(error)
//            }
//            self.Numbertext.text = a.description
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
//        post(a: 8)
    }
    @IBAction func BUtton9(_ sender: UIButton) {
        pri (a: 9)
//        post(a: 9)
    }
    @IBAction func Button10(_ sender: UIButton) {
        pri (a: 10)
//        post(a: 10)
    }
    

}
