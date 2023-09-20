//
//  APIManager.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/09/19.
//

import Foundation
import Alamofire

final class APIManger{
    static let shared = APIManger()
    
    func callAPIRequest<T: Decodable>(T: T.Type, requestType: APIHelper, completionHandler: @escaping (Result<T,Error>)->Void){
        AF.request(requestType.endPoint, method: requestType.method).validate().responseDecodable(of: T.self) { response in
            switch response.result{
            case .success(let value):
                completionHandler(.success(value))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

}
