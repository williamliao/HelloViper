//
//  CandyListProtocols.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

protocol CandyListViewProtocol: class {
    // PRESENTER -> VIEW
    func showCandies(with candies: [Candy])
    func showError(with error: Error)
}

protocol CandyListPresenterProtocol: class {
    //View -> Presenter
    var interactor: CandyListInputInteractorProtocol? {get set}
    var view: CandyListViewProtocol? {get set}
    var wireframe: CandyListWireFrameProtocol? {get set}
    
    func viewDidLoad()
    func showCandySelection(with candy: Candy, from view: CandyListViewController)
}

protocol CandyListInputInteractorProtocol: class {
    var presenter: CandyOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getCandyList()
    func showError(error: Error)
}

protocol CandyOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func candyListDidFetch(candyList: [Candy])
    func candyListDidFetchWithError(error: Error)
}

protocol CandyListWireFrameProtocol: class {
    //Presenter -> Wireframe
    func pushToCandyDetail(with candy: Candy,from view: CandyListViewController)
    static func createCandyListModule(candyListRef: CandyListViewController)
}
