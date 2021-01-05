//
//  CandyListWireframe.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyListWireframe: CandyListWireFrameProtocol {
   
    func pushToCandyDetail(with candy: Candy,from view: CandyListViewController) {
        let candyDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "CandyDetailViewController") as! CandyDetailViewController
        CandyDetailWireFrame.createCandyDetailModule(with: candyDetailViewController, and: candy)
        view.navigationController?.pushViewController(candyDetailViewController, animated: true)
    }
    
    class func createCandyListModule(candyListRef: CandyListViewController) {
        let presenter: CandyListPresenterProtocol & CandyOutputInteractorProtocol = CandyListPresenter()
        candyListRef.presenter = presenter
        candyListRef.presenter?.wireframe = CandyListWireframe()
        candyListRef.presenter?.view = candyListRef
        candyListRef.presenter?.interactor = CandyListInteractor()
        candyListRef.presenter?.interactor?.presenter = presenter
    }
    
}
