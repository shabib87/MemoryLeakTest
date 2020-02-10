//
//  CollectionViewController.swift
//  MemoryLeakTest
//
//  Created by Ahmad Shabibul Hossain on 2020-02-10.
//  Copyright © 2020 500px. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionViewCellID"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("CollectionViewController deinit")
    }
    
    private func onAlertTap() {
        print("Alert OK Tapped")
    }
    
    private func onCellTap() {
        print("Cell Tapped")
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? CollectionViewCell else {
                                                                fatalError()
        }
        
        // deinit will not be called because of strong retain cycle
        cell.onTap = onCellTap
        // uncomment to see deinit being called
//        cell.onTap = { [weak self] in
//            self?.onCellTap()
//        }
    
        return cell
    }
}
