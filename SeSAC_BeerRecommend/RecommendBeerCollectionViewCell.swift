//
//  RecommendBeerCollectionViewCell.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/08/08.
//

import UIKit

class RecommendBeerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(_ data: Beer){
        beerNameLabel.text = data.name
        beerNameLabel.textAlignment = .center
        beerNameLabel.font = .boldSystemFont(ofSize: 17)
        beerNameLabel.layer.borderColor = UIColor.black.cgColor
        beerNameLabel.layer.borderWidth = 1
        beerNameLabel.layer.cornerRadius = 5
        beerNameLabel.backgroundColor = .systemGray6
        
        beerImgView.kf.setImage(with: URL(string: data.imageURL))
        
        ibuLabel.text = "IBU: \(data.ibu ?? "Unknown")"
        ibuLabel.textAlignment = .center
        abvLabel.text = "ABV: \(data.abv ?? "Unknown")"
        abvLabel.textAlignment = .center
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }

}
