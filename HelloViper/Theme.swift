//
//  Theme.swift
//  HelloViper
//
//  Created by William on 2018/12/6.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

enum Theme: Int {
    case `default`, dark, graphical
    
    private enum Keys {
        static let selectedTheme = "SelectedTheme"
    }
    
    static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return Theme(rawValue: storedTheme) ?? .default
    }
    
    var mainColor: UIColor {
        switch self {
        case .default:
            return UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        case .dark:
            return UIColor(red: 41.0/255.0, green: 42.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        case .graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .default, .graphical:
            return UIColor.white
        case .dark:
            return UIColor(red: 41.0/255.0, green: 42.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .default, .graphical:
            return UIColor.black
        case .dark:
            return UIColor.white
        }
    }
    
    var tableCellSelectedBackground: UIColor {
        switch self {
        case .default, .graphical:
            return UIColor.white
        case .dark:
            return UIColor.black.withAlphaComponent(0.4)
        }
    }
    
    var candyGreen: UIColor {
        switch self {
        case .default, .graphical:
            return UIColor.green
        case .dark:
            return UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        }
    }
    
    func apply() {
        //UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
        //UserDefaults.standard.synchronize()
        
        UIApplication.shared.delegate?.window??.tintColor = mainColor
        
       // UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")
       // UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
        
        //UITableViewCell.appearance().backgroundColor = backgroundColor
       //UILabel.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).textColor = textColor
    }
}


