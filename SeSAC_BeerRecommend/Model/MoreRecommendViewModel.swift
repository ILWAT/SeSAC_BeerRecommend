//
//  MoreRecommendViewModel.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/09/21.
//

import Foundation

class MoreRecommendViewModel{
    var beerData: Observable<BeerDataModel> = Observable(value: BeerDataModel())
    
    func callRequest(){
        APIManger.shared.callAPIRequest(T: BeerDataModel.self, requestType: Router.getBeers) { response in
            switch response {
            case .success(let success):
                self.beerData.value = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
