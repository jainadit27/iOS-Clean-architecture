//
//  SearchResultsSectionHeader.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class SearchResultsSectionHeader: UIView {
    
    //View
    private let titleLabel : UILabel = .init()
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    @objc override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaults()
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setDefaults(){
        titleLabel.textColor = UIColor.title()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
    }
    
    private func createViews(){
        addSubview(titleLabel)
        titleLabel.alignTopTo(self, constant: AppMetrics.verticalPadding)
        titleLabel.alignCenterXTo(self, offset: 0)
        titleLabel.alignBottomTo(self, constant: AppMetrics.verticalPadding)
    }
    
    public func setHeaderTitle(_ title : String?){
         titleLabel.text = title
    }
}
