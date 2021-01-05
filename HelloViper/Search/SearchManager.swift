//
//  SearchManager.swift
//  HelloSearchViewController
//
//  Created by William on 2018/12/3.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

protocol searchUpdateDelegate: AnyObject {
    func searchBarDidPress()
}

class SearchManager: NSObject {
     weak var delegate: searchUpdateDelegate?
    var searchResultsController = UISearchController(searchResultsController: nil)
    var navgationController: UINavigationController?
    var searchText: String?
    var filteredCandies = [Candy]()
    var candies: Array? = [Candy]()
    
    init(nav: UINavigationController, arr: [Candy]) {
        self.navgationController = nav
        self.candies = arr
    }
    
    func configureSearchController() {
        self.searchResultsController.obscuresBackgroundDuringPresentation = false
        self.searchResultsController.searchResultsUpdater = self
        self.searchResultsController.hidesNavigationBarDuringPresentation = false
        self.searchResultsController.searchBar.showsCancelButton = false
        self.searchResultsController.dimsBackgroundDuringPresentation = false
        self.searchResultsController.searchBar.sizeToFit()
        self.searchResultsController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        self.searchResultsController.searchBar.delegate = self
        setAppearance()
    }
    
    func setAppearance() {
//        self.navgationController?.navigationItem.searchController = self.searchResultsController
//        self.navgationController?.navigationItem.titleView = self.searchResultsController.searchBar
//        self.navgationController?.navigationItem.hidesSearchBarWhenScrolling = false
        //  self.searchResultsController.searchBar.barStyle = .default
        self.searchResultsController.searchBar.barTintColor = Theme.dark.backgroundColor
        self.searchResultsController.searchBar.barStyle = .black
        self.searchResultsController.searchBar.backgroundImage = UIImage()
        //self.searchResultsController.searchBar.backgroundColor = Theme.dark.backgroundColor
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor : Theme.dark.textColor]
       // UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.backgroundColor : UIColor.clear]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search Candies", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return self.searchResultsController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        
      
        guard let candies = candies else {
            return
        }
        
        
        
        let filteredShopsA = candies[0].items.filter({ item in
            isFilterArrayRangeFound(candies: candies, item: item, scope: scope)
        })
    
        let filteredShopsB = candies[1].items.filter({ item in
            isFilterArrayRangeFound(candies: candies, item: item, scope: scope)
        })
        
        let filteredShopsC = candies[2].items.filter({ item in
            isFilterArrayRangeFound(candies: candies, item: item, scope: scope)
        })
        
//        print(filteredShopsA)
//        print(filteredShopsB)
//        print(filteredShopsC)
        
        var candyA = [Candy]()
        var candyB = [Candy]()
        var candyC = [Candy]()
        
        if !isFilterArrayEmpty(filterArray: filteredShopsA) {
            if !isFilterCandiesEmpty(candy: candyA) {
               // print(filteredShopsA)
                candyA[0] = createFilterCandy(candy: candies, filterArray: filteredShopsA, index: 0)
            } else {
                candyA.append(createFilterCandy(candy: candies, filterArray: filteredShopsA, index: 0))
            }
        }
        
        if !isFilterArrayEmpty(filterArray: filteredShopsB) {
            if !isFilterCandiesEmpty(candy: candyB) {
                //print(filteredShopsB)
                candyB[0] = createFilterCandy(candy: candies, filterArray: filteredShopsB, index: 1)
            } else {
                candyB.append(createFilterCandy(candy: candies, filterArray: filteredShopsB, index: 1))
            }
        }
        
        if !isFilterArrayEmpty(filterArray: filteredShopsC) {
            if !isFilterCandiesEmpty(candy: candyC) {
                //print(filteredShopsC)
                candyC[0] = createFilterCandy(candy: candies, filterArray: filteredShopsC, index: 2)
            } else {
                candyC.append(createFilterCandy(candy: candies, filterArray: filteredShopsC, index: 2))
            }
        }
        
//        print("candyA == \(candyA)")
//        print("candyB == \(candyB)")
//        print("candyC == \(candyC)")
        
        filteredCandies = candyA + candyB + candyC
        
       // print("filteredCandies == \(filteredCandies)")
 
        delegate?.searchBarDidPress()
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = self.searchResultsController.searchBar.selectedScopeButtonIndex != 0
        return self.searchResultsController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    
    func isFilterArrayEmpty(filterArray: [[String: Any]]) -> Bool {
        if filterArray.count == 0 {
            return true
        }
        return false
    }
    
    func isFilterArrayRangeFound(candies: [Candy], item: [String: Any], scope: String) -> Bool {
        
        if let name = item["Item"], let query = self.searchResultsController.searchBar.text {
         
            let doesCategoryMatch = (scope == "All") || (candies[0].category == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                
                //print((name as! String).lowercased().contains(query.lowercased()))
                
                return (name as! String).lowercased().contains(query.lowercased())
//                let found = (name as AnyObject).range(of: query, options: [.caseInsensitive])
//
//                if found.location != NSNotFound && doesCategoryMatch {
//                    return true
//                }
            }
        }
        return false
    }
    
    func isFilterCandiesEmpty(candy: [Candy]) -> Bool {
        if candy.count == 0 {
            return true
        }
        return false
    }
    
    func createFilterCandy(candy:[Candy], filterArray: [[String: Any]], index: NSInteger) -> Candy {
        return Candy(name:filterArray[0]["Item"] as! String, category: candy[index].category, items:filterArray)
    }
}



extension SearchManager : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let keyword = searchBar.text else {
            return
        }
        
        searchText = keyword
    }
}

extension SearchManager : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension SearchManager : UISearchControllerDelegate {
    
}
