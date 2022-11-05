//
//  BaseView.swift
//  MVVM_UnSplash_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import UIKit

class BaseView: UIView {
    
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
