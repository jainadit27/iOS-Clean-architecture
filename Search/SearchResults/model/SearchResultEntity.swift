//
//  SearchResultEntity.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import Foundation

class SearchResultEntity : NSObject{
    
    public let resultId : String?
    public let articleTitle : String?
    public let articlePublisher : String?
    public let articleImageUrl : String?
    
    override init() {
        self.resultId = ""
        self.articleTitle = "Tesla Faces a Challenger in the Home Solar Business"
        self.articlePublisher = "The New York Times"
        self.articleImageUrl = ""
    }
    
}
