//
//  CandyTableViewCell.swift
//  HelloViper
//
//  Created by William on 2018/12/5.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.textLabel?.backgroundColor = UIColor(red: 41.0/255.0, green: 42.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        self.textLabel?.textColor = Theme.dark.textColor
        let colorView = UIView()
        colorView.backgroundColor = Theme.dark.tableCellSelectedBackground
        self.selectedBackgroundView = colorView
//        self.detailTextLabel?.textColor = UIColor.white
      
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
