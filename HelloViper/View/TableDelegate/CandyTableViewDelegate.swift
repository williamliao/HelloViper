//
//  CandyTableViewDelegate.swift
//  HelloViper
//
//  Created by William on 2018/12/5.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyTableViewDelegate: NSObject, UITableViewDelegate {
    var presenter:CandyListPresenterProtocol?
    var candyViewRef: CandyListViewController?
    var candyList = [Candy]()
    var searchManagerRef : SearchManager?

    init(candies: [Candy], presenter: CandyListPresenterProtocol, candyViewRef: CandyListViewController, search:SearchManager) {
        self.candyList = candies
        self.presenter = presenter
        self.candyViewRef = candyViewRef
        self.searchManagerRef = search
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let view = candyViewRef else {
            return
        }
        
        guard let search = searchManagerRef else {
            return
        }
        if search.isFiltering() {
            let items = search.filteredCandies[indexPath.section].items
            let filterName = search.filteredCandies[indexPath.section].name
            let category = search.filteredCandies[indexPath.section].category
            let candy = Candy(name:filterName, category: category, items:items)
            presenter?.showCandySelection(with: candy , from: view)
        } else {
            let items = candyList[indexPath.section].items
            let item = items[indexPath.row]
            let filterName = item["Item"]
            let category = candyList[indexPath.section].category
            
            guard let name = filterName else {
                return
            }

            let candy = Candy(name:name as! String, category: category, items:items)
            presenter?.showCandySelection(with: candy , from: view)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = Theme.dark.backgroundColor
    }
}
