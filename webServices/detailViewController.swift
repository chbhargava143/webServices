//
//  detailViewController.swift
//  webServices
//
//  Created by chbn on 17/03/20.
//  Copyright © 2020 chbn. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
var id = String()
    var userId = String()
    var tittle = String()
    var subtitle = String()
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var userIDLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sutbTitleLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        idLbl.text = id
        userIDLbl.text = userId
        titleLbl.text = tittle
        sutbTitleLbl.text = subtitle
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
