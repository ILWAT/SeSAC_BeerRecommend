//
//  MoreRecommendViewController.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class MoreRecommendViewController: UIViewController {
    
    var beerData: BeerDataModel = []
    
    let apiManager = APIManger.shared

    @IBOutlet weak var beerCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "추천 맥주 더보기"
        
        setCollectionView()
        
        callRequest()
        
    }

    //서버 통신
    func callRequest(){
//        let url = "https://api.punkapi.com/v2/beers"
        
//        AF.request(url, method: .get).validate().responseJSON { response in
//            switch response.result{
//            case .success(let value):
//                let json = JSON(value)
//                print(json)
//                
//                for item in json.arrayValue{
//                    self.beerData.append(Beer(name: item["name"].stringValue, imageURL: item["image_url"].stringValue, description: item["description"].stringValue, abv: item["abv"].stringValue, ibu: item["ibu"].stringValue))
//                }
//                
//                self.beerCollectionView.reloadData()
//                
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        apiManager.callAPIRequest(T: BeerDataModel.self, requestType: .getBeers) { response in
            switch response {
            case .success(let success):
                self.beerData.append(contentsOf: success)
                self.beerCollectionView.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
        
    }

    func setCollectionView(){
        let nib = UINib(nibName: "RecommendBeerCollectionViewCell", bundle: .main)
        beerCollectionView.register(nib, forCellWithReuseIdentifier: "RecommendBeerCollectionViewCell")

        beerCollectionView.dataSource = self
        beerCollectionView.delegate = self
        
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let contentSize = UIScreen.main.bounds.width - (spacing * 2)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.itemSize = CGSize(width: contentSize, height: contentSize)
        
        beerCollectionView.collectionViewLayout = layout
    }
}


extension MoreRecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendBeerCollectionViewCell", for: indexPath) as! RecommendBeerCollectionViewCell
        
        cell.setUI(beerData[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        nextVC.beerData = beerData[indexPath.row]
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}
