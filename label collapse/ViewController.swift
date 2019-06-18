//
//  ViewController.swift
//  label collapse
//
//  Created by ibrahim doğan on 17.06.2019.
//  Copyright © 2019 Tabbar. All rights reserved.
//

import UIKit


class tableCell: UITableViewCell{
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "cell") as? tableCell{
            if isMoreShowLbl{
                cell.lbl.numberOfLines = 0
                cell.lbl.lineBreakMode = .byWordWrapping
                cell.lbl.sizeToFit()
            }else{
                cell.lbl.numberOfLines = 3
                cell.lbl.lineBreakMode = .byWordWrapping
                cell.lbl.sizeToFit()
         
            }
            return cell
            
        }else{
            return UITableViewCell()
        }
    }

    @IBOutlet weak var table: UITableView!
    var isMoreShowLbl = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func showMoreBtn(_ sender: UIButton) {
        isMoreShowLbl = !isMoreShowLbl
        let index = IndexPath(row: 2, section: 0)
        table.reloadRows(at: [index], with: UITableView.RowAnimation.middle)
        let index1 = IndexPath(row: 1, section: 0)
        table.reloadRows(at: [index1], with: UITableView.RowAnimation.fade)
    }
   
}

