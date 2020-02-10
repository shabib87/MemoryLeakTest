//
//  CollectionViewCell.swift
//  MemoryLeakTest
//
//  Created by Ahmad Shabibul Hossain on 2020-02-10.
//  Copyright © 2020 500px. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    deinit {
        print("CollectionViewCell deinit")
    }
    
    var onTap: (() -> ())?
    
    @IBAction private func tapAction() {
        onTap?()
    }
}
