//
//  AppSearchBarHeader.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit


class AppSearchBarHeader: UIView {
    
    public let searchBar : AppSearchBar = .init()
    private let gradientView : UIView = .init()
    private let gradientLayer : CAGradientLayer = .init()
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    @objc override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDefaults()
    }
    
    private func setDefaults(){
        self.addSubview(gradientView)
        gradientView.alignEqualTo(self)
        
        gradientLayer.colors = UIColor.headerGradient()
        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.1, y: 1)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        
        addSubview(searchBar)
        searchBar.alignTopTo(self, constant: AppMetrics.searchBarVerticalPadding)
        searchBar.alignLeadingTo(self, constant: AppMetrics.searchBarSidePadding)
        searchBar.alignTrailingTo(self, constant: AppMetrics.searchBarSidePadding)
        searchBar.alignBottomTo(self, constant: AppMetrics.searchBarVerticalPadding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = CGRect.init(x: 0,
                                          y: -AppMetrics.statusBarHeight(),
                                          width: gradientView.bounds.size.width,
                                          height: gradientView.bounds.size.height +  AppMetrics.statusBarHeight())
    }
    
}
