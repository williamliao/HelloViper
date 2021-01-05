//
//  CandyDataSource.swift
//  HelloViper
//
//  Created by William on 2018/12/5.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyDataSource: NSObject, UITableViewDataSource {
    
    var candySectionsList = [Candy]()
    var searchManager : SearchManager?
    var searchFooter: SearchFooter?
    
    init(searchVC: SearchManager, searchFooter: SearchFooter , candies: [Candy]) {
        self.searchManager = searchVC
        self.candySectionsList = candies
        self.searchFooter = searchFooter
        super.init()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let svc = searchManager else {
            return 0
        }
      
        if svc.isFiltering()  {
            return 1
        }
        
        return candySectionsList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        guard let svc = searchManager else {
            return ""
        }
        
        if svc.isFiltering()  {
            return ""
        }
        return candySectionsList[section].category
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //  let cell = tableView.dequeueReusableCell(withIdentifier: "candyCell", for: indexPath) as? CandyTableViewCell
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "candyCell") as? CandyTableViewCell else {
                return CandyTableViewCell(style: .subtitle, reuseIdentifier: "candyCell")
            }
            return cell
        }()
        
        
        guard let svc = searchManager else {
            return UITableViewCell()
        }
        
        if svc.isFiltering() {
        
            if (svc.filteredCandies.count > 0) {
                
           
                
                let item = svc.filteredCandies[indexPath.row]
            // let items = svc.filteredCandies[indexPath.section].items
               
                
                cell.textLabel?.text = item.name
                //cell.textLabel?.text = item["Item"] as? String
                
               // cell.detailTextLabel?.text = candySectionsList[indexPath.section].category as? String
                
                cell.imageView?.image = UIImage(named: item.name)
            }
        } else {
            let candySection = candySectionsList[indexPath.section].items
            let item = candySection[indexPath.row]
            
            cell.textLabel?.text = item["Item"] as? String
            //cell.detailTextLabel?.text = candySectionsList[indexPath.section].category as? String
            guard let imageName = item["Item"] as? String else {
                return cell
            }
            cell.imageView?.image = UIImage(named: imageName)
        }
      
//        if (svc.filteredCandies.count > 0) {
//            switch (indexPath.section) {
//            case 0:
//                print("0 == \(svc.filteredCandies[indexPath.row])")
//            case 1:
//                print("1 == \(svc.filteredCandies[indexPath.row])")
//            case 2:
//                print("2 == \(svc.filteredCandies[indexPath.row])")
//            default:
//                print("default")
//            }
//        }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let svc = searchManager else {
            return 0
        }
        
        guard let footer = searchFooter else {
            return 0
        }
        
        var items = [[String: Any]]()
   
        if svc.isFiltering()  {
            
            if svc.filteredCandies.count > 0 {
    
                    items = svc.filteredCandies[section].items
         
                if svc.filteredCandies[0].category == "Other" {
                    footer.setIsFilteringToShow(filteredItemCount: svc.filteredCandies.count, of: 6)
                } else if svc.filteredCandies[0].category == "Chocolate" {
                    footer.setIsFilteringToShow(filteredItemCount: svc.filteredCandies.count, of: 5)
                } else {
                    footer.setIsFilteringToShow(filteredItemCount: svc.filteredCandies.count, of: 4)
                }
                //print("count == \(svc.filteredCandies.count)")
              // print("section count == \(svc.filteredCandies[section].items.count)")
//                var row = 0
//                if svc.filteredCandies.count == 1 {
//                    row = svc.filteredCandies[0].items.count
//                } else if svc.filteredCandies.count == 2  {
//                    row = svc.filteredCandies[0].items.count + svc.filteredCandies[1].items.count
//                } else {
//                    row = svc.filteredCandies[0].items.count + svc.filteredCandies[1].items.count + svc.filteredCandies[2].items.count
//                }
           
                   // print("count == \(row)")
                
               //return row
                return svc.filteredCandies.count
            }
        } else {
            footer.setNotFiltering()
            items = candySectionsList[section].items
            return items.count
        }
        
        switch (svc.filteredCandies.count) {
        case 0:
            return svc.filteredCandies[0].items.count
        case 1:
            return svc.filteredCandies[1].items.count
        case 2:
            return svc.filteredCandies[2].items.count
        default:
            return 0
        }
    }
}
