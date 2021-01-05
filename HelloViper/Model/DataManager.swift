//
//  DataManager.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    var sections = [Candy]()
    let chocolate = [["Item": "Chocolate Bar","ItemId" : "1"],["Item": "Chocolate Chip","ItemId" : "2"],["Item": "Dark Chocolate","ItemId" : "3"],["Item": "Chocolate Coin","ItemId" : "4"],["Item": "Chocolate Egg","ItemId" : "5"]]
    let other = [["Item": "Caramel","ItemId" : "1"],["Item": "Sour Chew","ItemId" : "2"],["Item": "Gummi Bear","ItemId" : "3"],["Item": "Candy Floss","ItemId" : "4"],["Item": "Jelly Beans","ItemId" : "5"],["Item": "Liquorice","ItemId" : "6"]]
    let hard = [["Item": "Lollipop","ItemId" : "1"],["Item": "Candy Cane","ItemId" : "2"],["Item": "Jaw Breaker","ItemId" : "3"],["Item": "Toffee Apple","ItemId" : "4"]]
    
    func category() -> [Candy] {
       sections = [Candy(name:"Chocolate", category: "Chocolate", items:chocolate), Candy(name:"Hard", category: "Hard", items:hard), Candy(name:"Other", category: "Other", items:other)]
        return sections
    }
    
    func generateDataList() -> [Candy] {
        return category()
    }
    
    /*
     Candy(category:"Chocolate", name:"Chocolate Bar", image: UIImage(named: "Chocolate Bar")),
     Candy(category:"Chocolate", name:"Chocolate Chip", image: UIImage(named: "Chocolate Chip")),
     Candy(category:"Chocolate", name:"Dark Chocolate", image: UIImage(named: "Dark Chocolate")),
     Candy(category:"Hard", name:"Lollipop", image: UIImage(named: "Lollipop")),
     Candy(category:"Hard", name:"Candy Cane", image: UIImage(named: "Candy Cane")),
     Candy(category:"Hard", name:"Jaw Breaker", image: UIImage(named: "Jaw Breaker")),
     Candy(category:"Other", name:"Caramel", image: UIImage(named: "Caramel")),
     Candy(category:"Other", name:"Sour Chew", image: UIImage(named: "Sour Chew")),
     Candy(category:"Other", name:"Gummi Bear", image: UIImage(named: "Gummi Bear")),
     Candy(category:"Other", name:"Candy Floss", image: UIImage(named: "Candy Floss")),
     Candy(category:"Chocolate", name:"Chocolate Coin", image: UIImage(named: "Chocolate Coin")),
     Candy(category:"Chocolate", name:"Chocolate Egg", image: UIImage(named: "Chocolate Egg")),
     Candy(category:"Other", name:"Jelly Beans", image: UIImage(named: "Jelly Beans")),
     Candy(category:"Other", name:"Liquorice", image: UIImage(named: "Liquorice")),
     Candy(category:"Hard", name:"Toffee Apple", image: UIImage(named: "Toffee Apple"))
    */
}
