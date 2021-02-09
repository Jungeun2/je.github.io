//
//  ImageViewerViewController.swift
//  CollectionViewGoToNextPage
//
//  Created by 이정은 on 2020/11/05.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImageView()
        
    
    }
    
    private func setupImageView() {
        guard let name = imageName else { return }
        
        if let image = UIImage(named: name) {
            imageView.image = image
        }
    }
    
}
