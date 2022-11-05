//
//  SearchPhoto.swift
//  MVVM_UnSplash_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import Foundation

struct SearchPhoto: Codable, Hashable {
    let total, totalPages: Int
    let results: [SearchResult]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct SearchResult: Codable, Hashable {
    let urls: Urls
    
    enum CodingKeys: CodingKey {
        case urls
    }
}

struct Urls: Codable, Hashable {
    let thumb: String
    
    enum CodingKeys: CodingKey {
        case thumb
    }
}
