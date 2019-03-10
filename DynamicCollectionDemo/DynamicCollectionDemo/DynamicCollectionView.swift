//
//  DynamicCollectionView.swift
//  DynamicCollectionDemo
//
//  Created by Pulkit on 10/03/19.
//  Copyright © 2019 Yuvabrain. All rights reserved.
//

import Foundation
import UIKit

class DynamicCollectionView: UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
