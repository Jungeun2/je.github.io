//
//  ViewController.swift
//  CollectionViewGoToNextPage
//
//  Created by 이정은 on 2020/11/05.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

struct Item {
    var imageName: String
}

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var items: [Item] = [Item(imageName: "1"),
                         Item(imageName: "2"),
                         Item(imageName: "3"),
                         Item(imageName: "4"),
                         Item(imageName: "5"),
                         Item(imageName: "6"),
                         Item(imageName: "7"),
                         Item(imageName: "8"),
                         Item(imageName: "9"),
                         Item(imageName: "10"),
                         Item(imageName: "11"),
                         Item(imageName: "12")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    let viewImageSegue = "viewImageSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollctionViewItemSize()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        if segue.identifier == viewImageSegue {
            if let vc = segue.destination as? ImageViewerViewController {
                vc.imageName = item.imageName
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollctionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 2
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
            cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        performSegue(withIdentifier: viewImageSegue, sender: item)
    }
    
    
    
}


