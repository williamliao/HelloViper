//
//  CandyListViewController.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyListViewController: UIViewController {
    
    var presenter:CandyListPresenterProtocol?
    var candyListView = CandyTableView()
    var candyList = [Candy]()
    @IBOutlet var searchFooter: SearchFooter!
    
    lazy var dataSource: CandyDataSource = {
        let dataSource = CandyDataSource(searchVC:searchManager, searchFooter:searchFooter, candies: candyList)
        return dataSource
    }()
    
    lazy var delegate: CandyTableViewDelegate = {
        let delegate = CandyTableViewDelegate(candies: candyList, presenter: presenter!, candyViewRef: self, search: searchManager)
        return delegate
    }()
    
    lazy var searchManager: SearchManager = {
        let searchManager = SearchManager(nav: navigationController!, arr:candyList)
        return searchManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Candy Store"
        setUpNavgatinBar()
        requiredInitializer()
        setupView()
        loadData()
        registerTableView()
        setupSearchController()
    }
   
    func setUpNavgatinBar() {
        navigationController?.navigationBar.barTintColor = Theme.dark.backgroundColor
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.dark.textColor]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.dark.textColor]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func requiredInitializer() {
        CandyListWireframe.createCandyListModule(candyListRef: self)
    }
    
    func setupView() {
        candyListView = CandyTableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(candyListView)
    }
    
    func loadData() {
        presenter?.viewDidLoad()
    }
    
    func registerTableView() {
        candyListView.candyTblView.delegate = delegate
        candyListView.candyTblView.dataSource = dataSource
        //candyListView.candyTblView.tableHeaderView = searchManager.searchResultsController.searchBar
        // Setup the search footer
        candyListView.candyTblView.tableFooterView = searchFooter
    }
    
    func setupSearchController() {
        searchManager.configureSearchController()
        searchManager.delegate = self
        searchManager.setAppearance()
        navigationItem.titleView = searchManager.searchResultsController.searchBar
        //navigationItem.searchController = searchManager.searchResultsController
        definesPresentationContext = true
        
    }
}

extension CandyListViewController: CandyListViewProtocol {
    
    func showCandies(with candies: [Candy]) {
        candyList = candies
        candyListView.candyTblView.reloadData()
    }
    
    func showError(with error: Error) {
        
        let alert = DialogPresenter.init(title: "Error", message: error.localizedDescription, acceptTitle: "OK", rejectTitle: "") { (success) in
        }
        
        alert.present(in: self)
    }
}

extension CandyListViewController: searchUpdateDelegate {
    func searchBarDidPress() {
        candyListView.candyTblView.reloadData()
    }
}
