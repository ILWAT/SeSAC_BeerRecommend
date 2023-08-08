//
//  DetailViewController.swift
//  SeSAC_BeerRecommend
//
//  Created by 문정호 on 2023/08/08.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    
    var beerData: Beer? = nil
    
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setData(beerdata: self.beerData)
    }
    
    //MARK: - setUI
    func setUI(){
        nameLabel.font = .boldSystemFont(ofSize: 17)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .blue.withAlphaComponent(0.5)
        nameLabel.layer.cornerRadius = 10
        nameLabel.clipsToBounds = true
        
    }
    
    func setData(beerdata: Beer?){
        guard let beerdata else { return }
        nameLabel.text = beerdata.name
        descriptionTextView.text = beerdata.description
        
        let url = URL(string: beerdata.imageURL)
        beerImageView.kf.setImage(with: url)
        
        abvLabel.text = "abv: \(beerdata.abv ?? "Unknown")"
        ibuLabel.text = "ibu: \(beerdata.ibu ?? "Unknown")"
    }
    

}
