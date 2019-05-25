//
//  ViewController.swift
//  DynamicColDemo
//
//  Created by Yuva Brain on 25/05/19.
//  Copyright © 2019 Yuva Brain. All rights reserved.
//

import UIKit

class DynamicColPosition: UICollectionView {
    
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

class ColCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel! {
        didSet{
            lblTitle.layer.borderColor = UIColor.blue.cgColor
            lblTitle.layer.borderWidth = 1.0
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var colView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colView.delegate = self
        colView.dataSource = self
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCell", for: indexPath) as? ColCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width/3-5, height: colView.frame.size.height)
    }
}

