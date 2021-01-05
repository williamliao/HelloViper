//
//  CandyTableView.swift
//  HelloViper
//
//  Created by William on 2018/12/5.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CandyTableView: UIView {
    lazy var candyTblView: UITableView = {
        var candyTblView = UITableView()
        candyTblView = UITableView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        return candyTblView
    }()
    
  /*  convenience init(args: Whatever) {
        self.init(frame: CGRect.zero)
        //assign custom vars
    }*/
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
  /*  override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }*/
    
    private func commonInit() {
        //custom initialization
        candyTblView.register(CandyTableViewCell.self, forCellReuseIdentifier: "candyCell")
        candyTblView.backgroundColor = Theme.dark.backgroundColor
        candyTblView.tableFooterView = UIView()
        self.addSubview(candyTblView)
    }
    
    override func updateConstraints() {
        //set subview constraints here
        super.updateConstraints()
        addConstraints()
    }
    
  /*  override func layoutSubviews() {
        super.layoutSubviews()
        //manually set subview frames here
    }*/
    
    func addConstraints() {
        candyTblView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            let guide = self.safeAreaLayoutGuide
            candyTblView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            candyTblView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            candyTblView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
            candyTblView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            
        } else {
            let guide = self.layoutMarginsGuide
            let vc = parentViewController()
            NSLayoutConstraint.activate([
                candyTblView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
                candyTblView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
                candyTblView.topAnchor.constraint(equalTo: vc.topLayoutGuide.topAnchor),
                candyTblView.bottomAnchor.constraint(equalTo: vc.bottomLayoutGuide.bottomAnchor)
            ])
        }
    }
}
