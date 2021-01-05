//
//  CandyDetailProtocols.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

protocol CandyDetailPresenterProtocol: class {
    
    var wireframe: CandyDetailWireFrameProtocol? {get set}
    var view: CandyDetailViewProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol CandyDetailViewProtocol: class {
    //Presenter -> View
    func showCandyDetail(with candy: Candy)
}

protocol CandyDetailWireFrameProtocol: class {
    func goBackToCandyListView(from view: UIViewController)
}
