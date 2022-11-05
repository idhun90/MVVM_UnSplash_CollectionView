//
//  UnsplashViewController.swift
//  MVVM_UnSplash_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import UIKit

enum Section {
    case main
}

final class UnsplashViewController: BaseViewController {
    
    private let mainView = UnsplashView()
    
    let viewModel = PhotoViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, SearchResult>!
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.searchBar.delegate = self
        configureDataSource()
        bind()
    }
    
    private func bind() {
        viewModel.photoList.bind { [weak self] photo in
            var snapshot = NSDiffableDataSourceSnapshot<Section, SearchResult>()
            snapshot.appendSections([.main])
            snapshot.appendItems(photo.results)
            self?.dataSource.apply(snapshot)
        }
    }
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<UnsplashCollectionViewCell, SearchResult> { cell, indexPath, itemIdentifier in
            cell.layer.borderWidth = 1
            cell.layer.backgroundColor = UIColor.black.cgColor
            
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    cell.imageView.image = UIImage(data: data!)
                }
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, SearchResult>(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
    }
}

extension UnsplashViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchPhoto(query: searchBar.text!)
    }
}
