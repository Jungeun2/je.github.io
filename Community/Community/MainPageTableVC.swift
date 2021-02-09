//
//  MainPageTableVC.swift
//  Community
//
//  Created by 이정은 on 2020/10/21.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class MainPageTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var boards: [BoardList]?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainPageViewCell", for: indexPath) as! MainPageTableViewCell
        
        if let boards = self.boards {
        let model = boards[indexPath.row]
            
            cell.txtTitle.text = model.b_title
            cell.txtUserId.text = model.userId
            cell.txtConut.text = String(model.b_count ?? 0)
            cell.txtSaveTime.text = String(model.b_date ?? 0)
            cell.txtComment.text = String(model.commentCount ?? 0)
        }
        return cell
    }
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}


