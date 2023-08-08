//
//  ViewController.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var moreRecommendButton: UIButton!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var beerData: Beer? = nil
    
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        callRequest()
    }
    
    //MARK: - setUI
    func setUI(){
        nameLabel.font = .boldSystemFont(ofSize: 17)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .blue.withAlphaComponent(0.5)
        nameLabel.layer.cornerRadius = 10
        nameLabel.clipsToBounds = true
        
        moreRecommendButton.tintColor = .green
        moreRecommendButton.layer.cornerRadius = 5
        moreRecommendButton.layer.borderColor = UIColor.black.cgColor
        moreRecommendButton.layer.borderWidth = 1
    }
    
    func setData(beerdata: Beer?){
        guard let beerdata else { return }
        nameLabel.text = beerdata.name
        descriptionTextView.text = beerdata.description
        
        let url = URL(string: beerdata.imageURL)
        beerImageView.kf.setImage(with: url)
    }
    
    //MARK: - callRequest
    func callRequest(){
        let url = "https://api.punkapi.com/v2/beers/random"
        AF.request(url, method: .get).validate().responseJSON{ response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                self.beerData = Beer(name: json[0]["name"].stringValue, imageURL: json[0]["image_url"].stringValue, description: json[0]["description"].stringValue, abv: nil, ibu: nil)
                
                print(self.beerData!)
                
                self.setData(beerdata: self.beerData)
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    @IBAction func tappedMoreRecommendButton(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(identifier: "MoreRecommendViewController") as! MoreRecommendViewController
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

