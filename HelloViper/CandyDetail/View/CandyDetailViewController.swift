//
//  CandyDetailViewController.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyDetailViewController: UIViewController {
    
    @IBOutlet var candyImage: UIImageView!
    @IBOutlet var candyNameLbl: UILabel!
    @IBOutlet var categoryLbl: UILabel!
    
    var presenter: CandyDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 41.0/255.0, green: 42.0/255.0, blue: 48.0/255.0, alpha: 1.0)
    }
}

extension CandyDetailViewController: CandyDetailViewProtocol {
  
    func showCandyDetail(with candy: Candy) {
        if let descriptionLabel = candyNameLbl, let detailDescriptionLabel = categoryLbl, let candyImageView = candyImage {
            descriptionLabel.text = candy.name
            detailDescriptionLabel.text = candy.category
            candyImageView.image = UIImage(named: candy.name)
            title = candy.category
        }
    }
}
