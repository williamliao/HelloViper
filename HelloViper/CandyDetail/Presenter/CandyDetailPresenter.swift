//
//  CandyDetailPresenter.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyDetailPresenter: CandyDetailPresenterProtocol {
    
    var view: CandyDetailViewProtocol?
    var wireframe: CandyDetailWireFrameProtocol?
    var candy: Candy?
    
    func viewDidLoad() {
        view?.showCandyDetail(with: candy!)
    }
    
    func backButtonPressed(from view: UIViewController) {
        
    }
    
}
