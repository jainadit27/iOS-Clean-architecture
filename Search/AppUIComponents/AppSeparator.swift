//
//  AppSeparator.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class AppSeparator: UIView {
    
    private let separatorHeight : CGFloat = 1
    
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
        self.backgroundColor = UIColor.separator()
        setHeight(separatorHeight)
    }
}
