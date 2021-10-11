//
//  Network.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation
import Alamofire
import RxSwift

class Network: Networking {
    
    func request<T: Decodable>(url: String,
                               method: HTTPMethod = .get,
                               parameters: [String : Any]? = nil) -> Single<T> {
        return Single.create { single in
            
            let request = AF
                .request(url, method: method, parameters: parameters,
                         encoding: URLEncoding.queryString)
                .validate()
                .response(completionHandler: { response in
                    if let error = response.error {
                        return single(.failure(error))
                    }
                    
                    do {
                        let object = try JSONDecoder()
                            .decode(T.self, from: response.data ?? Data())
                        single(.success(object))
                    } catch {
                        single(.failure(error))
                    }
                })
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
