//
//  Extensions.swift
//  HelloViper
//
//  Created by William on 2018/12/5.
//  Copyright © 2018 William. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    //Get Parent View Controller from any view
    func parentViewController() -> UIViewController {
        var responder: UIResponder? = self
        while !(responder is UIViewController) {
            responder = responder?.next
            if nil == responder {
                break
            }
        }
        return (responder as? UIViewController)!
    }
}

extension UIAlertController {
    
    func addAction(title: String, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        let okAction = UIAlertAction(title: title, style: style, handler: handler)
        addAction(okAction)
        return self
    }
    
    func addActionWithTextFields(title: String, style: UIAlertAction.Style = .default, handler: ((UIAlertAction, [UITextField]) -> Void)? = nil) -> Self {
        let okAction = UIAlertAction(title: title, style: style) { [weak self] action in
            handler?(action, self?.textFields ?? [])
        }
        addAction(okAction)
        return self
    }
    
    func addTextField(handler: @escaping (UITextField) -> Void) -> Self {
        addTextField(configurationHandler: handler)
        return self
    }
    
    func show() {
        if let topController = UIApplication.topViewController() {
            topController.present(self, animated: true, completion: nil)
        }
    }
    
    func show(from viewController:UIViewController) {
        DispatchQueue.main.async {
            viewController.present(self, animated: true, completion: nil)
        }
        
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

struct DialogPresenter {
    typealias Handler = (Bool) -> Void
    
    let title: String
    let message: String
    let acceptTitle: String
    let rejectTitle: String
    let handler: Handler
    
    
    func present(in viewController: UIViewController) {
            UIAlertController.init(title: title, message: message, preferredStyle: .alert)
                .addAction(title: "OK", style: .cancel)
                .show(from: viewController)
    }
}

extension DialogPresenter {
    init(title: String, handler: @escaping Handler) {
        self.title = title
        self.handler = handler
        message = "DialogPresenter"
        acceptTitle = "Yes"
        rejectTitle = "No"
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
