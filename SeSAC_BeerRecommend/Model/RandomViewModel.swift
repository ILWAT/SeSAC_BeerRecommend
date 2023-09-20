//
//  RandomViewModel.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/09/21.
//

import Foundation

class RandomViewModel{
    let beerData: Observable<BeerDataModel> = Observable(value: BeerDataModel())
    
    func callrequest(){
        APIManger.shared.callAPIRequest(T: BeerDataModel.self, requestType: Router.getRandomBeer) { response in
            switch response {
            case .success(let success):
                self.beerData.value.append(contentsOf: success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
