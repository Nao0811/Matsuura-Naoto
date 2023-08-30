//
//  TableViewController.swift
//  TableView
//
//  Created by 松浦直叶 on 2023/08/27.
//

import UIKit

class TableViewController: UITableViewController {
    var names: [String] = [
            "阿部",
            "石田",
            "上田",
            "遠藤",
            "及川",
            "梶原",
            "菊池",
            "工藤",
        ]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            names = userDefaults.object(forKey: "add") as! [String]
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source
    //セクションの数を返すメゾット
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //セクションの中の行(セル)の数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //配列の変数名.countで配列の要素数を取得できる
        return names.count
    }
    
    //セルの表示内容を定設定する
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //どのセルを使用するかを設定している
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        //セルのラベルと配列の中身を表示
        cell.textLabel?.text = names[indexPath.row]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        let userDefaults = UserDefaults.standard
        
        print("削除前",names)
        if editingStyle == .delete{
            
            self.names.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            
        }
        print("削除後",names)
        userDefaults.set(names, forKey: "add")
        
    }

}
