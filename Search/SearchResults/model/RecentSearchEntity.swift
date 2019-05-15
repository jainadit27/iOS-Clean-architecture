//
//  RecentSearchEntity.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import Foundation

class RecentSearchEntity : NSObject{
    
    public var searchId : String?
    public var query : String?
    public var timestamp : Double?
    public var index : Int
    public var totalCount : Int?
    
    override init() {
        self.searchId = ""
        self.query = "Tesla"
        self.timestamp = 0
        self.index = -1
    }
    
    convenience init(query : String) {
        self.init()
        self.query = query
    }
    
}
