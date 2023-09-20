//
//  APIService.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/09/20.
//

import Foundation
import Alamofire

enum APIHelper {
    case getBeers
    case getASingleBeer(beerID: Int)
    case getRandomBeer
    
    var baseURL: String{
        return "https://api.punkapi.com/v2/"
    }
    
    var endPoint: URL{
        switch self {
        case .getBeers:
            return URL(string:baseURL + "beers")!
        case .getASingleBeer(let id):
            return URL(string: baseURL + "beers/\(id)")!
        case .getRandomBeer:
            return URL(string:baseURL + "beers/random")!
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
}

