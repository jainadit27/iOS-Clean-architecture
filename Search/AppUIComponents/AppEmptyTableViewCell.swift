//
//  AppEmptyTableViewCell.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class AppEmptyTableViewCell: AppTableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDefaults(){
        contentView.setHeight(0)
    }
}
