//
//  ViewController.swift
//  webServices
//
//  Created by chbn on 17/03/20.
//  Copyright © 2020 chbn. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var table_View: UITableView!
    
    var dataArray = [[String : Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        table_View.delegate = self
        table_View.dataSource = self
      getDataUsingAPI(url: "https://jsonplaceholder.typicode.com/", servieUrl: "posts")
    }
    func getDataUsingAPI(url : String , servieUrl : String){
        let url = URL(string:  url+servieUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if (response != nil){
                do{
                    let dictDat = try JSONSerialization.jsonObject(with: data!, options: []) as! [Any]
                    self.dataArray = dictDat as! [[String : Any]]
                    print(dictDat)
                    print(self.dataArray.count)
                    DispatchQueue.main.async {
                        self.table_View.reloadData()
                    }
                }
                catch
                {
                    
                }
                
            }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_View.dequeueReusableCell(withIdentifier: "dataTableViewCell", for: indexPath) as! dataTableViewCell
        let datas = dataArray[indexPath.row]
        if let title = datas["title"] as? String{
            cell.titleLbl.text = title
        }
        if let subtitle = datas["body"] as? String{
            cell.subTitleLbl.text = subtitle
        }
        return cell
       }
}

