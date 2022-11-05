//
//  Service.swift
//  MVVM_UnSplash_CollectionView
//
//  Created by 도헌 on 2022/11/05.
//

import Foundation

import Alamofire

class APIService {
    
    private init() { }
    
    static func searchPhoto(query: String, completion: @escaping (SearchPhoto?, Int?, Error?) -> Void) {
        let url = "\(APIKey.searchURL)\(query)"
        let header: HTTPHeaders = ["Authorization": APIKey.authorization]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: SearchPhoto.self) { response in
            switch response.result {
            case .success(let value):
                completion(value, response.response?.statusCode, nil)
            case .failure(let error):
                completion(nil, response.response?.statusCode, error)
            }
        }
    }
}
