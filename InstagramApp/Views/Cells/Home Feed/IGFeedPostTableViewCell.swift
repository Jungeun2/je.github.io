//
//  IGFeedPostTableViewCell.swift
//  InstagramApp
//
//  Created by 이정은 on 2020/11/25.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        
    }

}
