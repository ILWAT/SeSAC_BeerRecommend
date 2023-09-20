//
//  Router.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/09/21.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getBeers
    case getASingleBeer(beerID: Int)
    case getRandomBeer
    
    var baseURL: URL{
        switch self {
        case .getBeers, .getASingleBeer, .getRandomBeer:
            return URL(string: "https://api.punkapi.com/v2/")!
        }
        
    }
    
    var endPoint: String{
        switch self {
        case .getBeers:
            return "beers"
        case .getASingleBeer(let id):
            return "beers/\(id)"
        case .getRandomBeer:
            return "beers/random"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .getBeers, .getASingleBeer, .getRandomBeer:
            return .get
        }
    }
    
    var parameters: [String: String]{
        switch self {
        case .getBeers, .getASingleBeer, .getRandomBeer:
            return ["": ""]
        }
    }
    
    var header: HTTPHeaders{
        switch self {
        case .getBeers, .getASingleBeer, .getRandomBeer:
            return ["": ""]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.headers = header
        request.method = method
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(parameters, into: request)
        
        return request
    }
}
