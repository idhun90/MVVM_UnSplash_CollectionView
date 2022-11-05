//
//  BaseCollectionViewCell.swift
//  MVVM_UnSplash_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureUI() { }
    func setupLayout() { }
}
