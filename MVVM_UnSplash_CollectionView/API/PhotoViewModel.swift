//
//  PhotoViewModel.swift
//  MVVM_UnSplash_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import Foundation

class PhotoViewModel {
    
    var photoList: Observable<SearchPhoto> = Observable(SearchPhoto(total: 0, totalPages: 0, results: []))

    func fetchPhoto(query: String) {
        APIService.searchPhoto(query: query) { [weak self] photo, statusCode, error in
            guard let self = self else { return }
            guard let statusCode = statusCode, statusCode == 200 else { return }
            guard let photo = photo else { return }
            self.photoList.value = photo
        }
    }
    
}


