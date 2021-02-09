//
//  RankTableViewCell.swift
//  Community
//
//  Created by 이정은 on 2020/10/21.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class RankTableViewCell: UITableViewCell {
    @IBOutlet var txtTitle: UILabel!
    @IBOutlet var txtUserId: UILabel!
    @IBOutlet var txtCount: UILabel!
    @IBOutlet var txtSaveTime: UILabel!
    @IBOutlet var txtCommnet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
