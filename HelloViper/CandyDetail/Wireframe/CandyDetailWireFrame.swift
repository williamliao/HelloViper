//
//  CandyDetailWireFrame.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyDetailWireFrame: CandyDetailWireFrameProtocol {
    
    var indexPath: IndexPath?
    
    class func createCandyDetailModule(with candyDetailRef: CandyDetailViewController, and candy: Candy) {
        let presenter = CandyDetailPresenter()
        presenter.candy = candy
        candyDetailRef.presenter = presenter
        candyDetailRef.presenter?.view = candyDetailRef
        candyDetailRef.presenter?.wireframe = CandyDetailWireFrame()
    }
    
    func goBackToCandyListView(from view: UIViewController) {
        
    }
    
}
