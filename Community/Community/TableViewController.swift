//
//  TableViewController.swift
//  Community
//
//  Created by 이정은 on 2020/09/16.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var boards: [BoardList]?
    var BoardView: [BoardView]?
    var titleString: String?
    var loginId: String?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationItem.title = titleString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boards?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if let boards = self.boards {
            let model = boards[indexPath.row]
            
            cell.txtTitle.text = model.b_title
            cell.txtName.text = (model.userId ?? "")
        
            let unixTimestamp = model.b_date ?? 0
            let date = Date(timeIntervalSince1970: unixTimestamp / 1000)
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
            dateFormatter.dateFormat = "HH:mm"
            let strDate = dateFormatter.string(from: date)
            cell.txtDate.text = strDate
            
            cell.txtCount.text = "조회 " + String(model.b_count ?? 0)
            cell.txtComment.text = "댓글 " + String(model.commentCount ?? 0)
    
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let boards = self.boards {
        let model = boards[indexPath.row]
            let StoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let detailViewController = StoryBoard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
            detailViewController.id = model.b_id
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }


//            
//            let model = boards[indexPath.row]
//              model.b_id



    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }


}
