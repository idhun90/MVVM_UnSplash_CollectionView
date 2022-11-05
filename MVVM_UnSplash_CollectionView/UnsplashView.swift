//
//  UnsplashView.swift
//  MVVM_UnSplash_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import UIKit

import SnapKit

final class UnsplashView: BaseView {
    
    let searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.searchBarStyle = .minimal
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func configureUI() {
        backgroundColor = .white
        
    }
    
    override func setupLayout() {
        [searchBar, collectionView].forEach {
            addSubview($0)
        }
        let spacing = 20
        
        searchBar.snp.makeConstraints {
            let height = 44
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(spacing)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(height)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(spacing/2)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        
    }
}

extension UnsplashView {
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2)
        
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let gruop = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
        
        gruop.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let section = NSCollectionLayoutSection(group: gruop)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
