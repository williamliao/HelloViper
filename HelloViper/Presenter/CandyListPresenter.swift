//
//  CandyListPresenter.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyListPresenter: CandyListPresenterProtocol {
    var interactor: CandyListInputInteractorProtocol?
    var view: CandyListViewProtocol?
    var wireframe: CandyListWireFrameProtocol?
    var presenter: CandyListPresenterProtocol?

    func showCandySelection(with candy: Candy, from view: CandyListViewController) {
        //print(candy)
        wireframe?.pushToCandyDetail(with: candy, from: view)
    }
   
    func viewDidLoad() {
        self.loadFruitList()
    }
    
    func loadFruitList() {
        interactor?.getCandyList()
    }

}

extension CandyListPresenter: CandyOutputInteractorProtocol {
   
    func candyListDidFetch(candyList: [Candy]) {
        view?.showCandies(with: candyList)
    }
    
    func candyListDidFetchWithError(error: Error) {
        view?.showError(with: error)
    }
}
