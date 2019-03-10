//
//  ViewController.swift
//  DynamicCollectionDemo
//
//  Created by Pulkit on 09/03/19.
//  Copyright © 2019 Yuvabrain. All rights reserved.
//

import UIKit

class ColCellDynamicCell: UICollectionViewCell {
    
    @IBOutlet weak var btnName: UIButton! {
        didSet{
            self.layer.cornerRadius = self.frame.size.height/2
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.black.cgColor
            self.backgroundColor = UIColor.gray
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class ViewController: UIViewController {

    //MARK:- Outlets
    
    @IBOutlet var colView: UIView!
    
    //------------------------------------------
    
    //MARK:- Class Variables
    var arrData = ["Test1","Test2","Test3","Test4","Test5","Test6"]
    
    //------------------------------------------
    
    //MARK:- Custom Methods
    func setUpView(){
        self.colView.backgroundColor = UIColor.yellow
    }
    //------------------------------------------
    
    //MARK:- API Methods
    
    //------------------------------------------
    
    //MARK:- Action Methods
    
    //------------------------------------------
    
    //MARK:- Memory Management Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        
    }
    
    //------------------------------------------
    
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }    
    //------------------------------------------
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCellDynamicCell", for: indexPath) as? ColCellDynamicCell else {
            return UICollectionViewCell()
        }
        cell.btnName.backgroundColor = UIColor.gray
        cell.btnName.setTitle(self.arrData[indexPath.row], for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = UIScreen.main.bounds.width
        return CGSize(width: size/3, height: self.colView.frame.size.height)
    }
}
