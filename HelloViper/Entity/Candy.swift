//
//  Candy.swift
//  HelloViper
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

//struct Candy {
//    let category : String!
//    let name : String!
//    let image: UIImage!
//}

struct Candy {
   
    let name : String
    let category : String
    var items : [[String:Any]]
    
    var hashValue: Int {
        return name.hashValue
    }
    
}

extension Candy: Equatable {
    static func ==(lhs: Candy, rhs: Candy) -> Bool {
        let areEqual = lhs.name == rhs.name &&
            lhs.category == rhs.category
        
        return areEqual
    }
}
extension Candy: Hashable {
    static func === (lhs: Candy, rhs: Candy) -> Bool {
        return lhs.name == rhs.name && lhs.category == rhs.category
    }
}




