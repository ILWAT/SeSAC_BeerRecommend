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
    
    var viewmodel: RandomViewModel = RandomViewModel()
    
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        viewmodel.beerData.bind { value in
            self.setData(beerdata: value)
        }
        viewmodel.callrequest()
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
    
    func setData(beerdata: BeerDataModel?){
        guard let beerdata = beerdata else { return }
        nameLabel.text = beerdata.first?.name
        descriptionTextView.text = beerdata.first?.description
        
        let url = URL(string: beerdata.first?.imageURL ?? "")
        beerImageView.kf.setImage(with: url)
    }
    
    
    @IBAction func tappedMoreRecommendButton(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(identifier: "MoreRecommendViewController") as! MoreRecommendViewController
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

