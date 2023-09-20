//
//  Observable.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/09/21.
//

import Foundation

class Observable<T>{
    private var completion: ((T)->Void)?
    
    var value: T{
        didSet{
            completion?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(closure: @escaping (T) -> Void){
        completion = closure
    }
}
