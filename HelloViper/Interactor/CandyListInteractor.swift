//
//  CandyListInteractor.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import Foundation

class CandyListInteractor: CandyListInputInteractorProtocol {
    
    weak var presenter: CandyOutputInteractorProtocol?
    
    func getCandyList() {
        if getAllCandiesDetail().count != 0 {
            presenter?.candyListDidFetch(candyList: getAllCandiesDetail())
        } else {
           let error = NSError(domain: "HelloCandyDomain", code: -900, userInfo: [ NSLocalizedDescriptionKey: "No Data"])
           showError(error: error)
        }
    }
    
    func getAllCandiesDetail() -> [Candy] {
        var candyList = [Candy]()
        let dataManager = DataManager()
        let allCandiesDetail = dataManager.generateDataList()
        for item in allCandiesDetail {
            candyList.append(item)
        }
        return candyList.count == 0 ? [Candy]() : candyList
    }
 
    func showError(error: Error) {
        presenter?.candyListDidFetchWithError(error: error)
    }
}
