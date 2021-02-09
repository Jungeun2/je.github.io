//
//  CommentCell.swift
//  Community
//
//  Created by 이정은 on 2020/09/23.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet var commentId: UILabel!
    @IBOutlet var commentco: UILabel!
    @IBOutlet var commentDate: UILabel!
    @IBOutlet var commentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commentDate.textColor = UIColor.gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func updateBtn(_ sender: UIButton) {
    }
    @IBAction func deleteBtn(_ sender: UIButton) {
    }
    @IBAction func secondCommBtn(_ sender: UIButton) {
    }
    
}
