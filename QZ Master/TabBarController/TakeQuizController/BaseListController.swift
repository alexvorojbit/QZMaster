//
//  BaseListController.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 1/26/21.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .systemRed
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
