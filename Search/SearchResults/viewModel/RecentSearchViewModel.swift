//
//  RecentSearchViewModel.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class RecentSearchViewModel : NSObject, RecentSearchTableViewDataSource{
    
    var entitity : RecentSearchEntity?
    
    private override init() {
        super.init()
    }
    
    convenience init(_ entitity : RecentSearchEntity) {
        self.init()
        self.entitity = entitity;
    }
    
    func getTitle() -> String? {
        return self.entitity?.query
    }
    
    func shouldShowTopSeparator() -> Bool {
        if(self.entitity?.index == 0){
            return true
        }
        return false
    }
    
    func getIndex() -> Int {
        if let entity = self.entitity {
            return entity.index
        }
        return -1
    }
    
}
