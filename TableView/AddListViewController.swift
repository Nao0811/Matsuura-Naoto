//
//  AddListViewController.swift
//  TableView
//
//  Created by 松浦直叶 on 2023/08/30.
//

import UIKit

class AddListViewController: UIViewController {

    @IBOutlet weak var addTextField: UITextField!
    var taskArray: [String] = [] //入力したリストを格納する配列
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userDefaults = UserDefaults.standard
                if userDefaults.object(forKey: "add") != nil{
                    taskArray = userDefaults.object(forKey: "add") as! [String]
        }
    }
    

    @IBAction func addTaskaddTask(_ sender: Any) {
        let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる

    taskArray.append(addTextField.text!) //TextFieldで記入されたテキストを入れる

    userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存

    self.navigationController?.popViewController(animated: true) //1つ前の画面に戻る
    }
    
}
