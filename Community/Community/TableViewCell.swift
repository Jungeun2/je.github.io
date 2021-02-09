//
//  TableViewCell.swift
//  Community
//
//  Created by 이정은 on 2020/09/16.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var txtTitle: UILabel!
    @IBOutlet var txtName: UILabel!
    @IBOutlet var txtComment: UILabel!
    @IBOutlet var txtCount: UILabel!
    @IBOutlet var txtDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
