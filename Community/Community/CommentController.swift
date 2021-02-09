//
//  CommentController.swift
//  Community
//
//  Created by 이정은 on 2020/09/22.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class CommentController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var id: Int?
    var comment: [ViewComments]?
    var ViewItem: BoardView?
//    var CommentList: [comment]?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if let id = self.id {
        NetworkHandler.getComment({ comment in
            self.comment = comment
        }, b_id: id)
        NetworkHandler.DetailBoard({ ViewItem in
            self.ViewItem = ViewItem
        }, b_id: id)
    }
        
//        let newImage = Data(base64Encoded: imageBase64String)
        
        
        
//        let profile = UIImage.pngData(self.profile.image!)()?.base64EncodedString()
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        
        if let comment = self.comment {
            let model = comment[indexPath.row]
            cell.commentId.text = model.userId
            cell.commentco.text = model.c_content
            cell.commentDate.text = String(model.c_date ?? 0)
            
        
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }


}
