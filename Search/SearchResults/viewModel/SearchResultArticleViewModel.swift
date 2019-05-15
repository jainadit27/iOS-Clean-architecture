//
//  SearchResultArticleViewModel.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class SearchResultArticleViewModel : NSObject, SearchResultArticleTableViewDataSource{
    
    var entitity : SearchResultEntity?
    
    private override init() {
        super.init()
    }
    
    convenience init(_ entitity : SearchResultEntity) {
        self.init()
        self.entitity = entitity;
    }
    
    func getTitle() -> String? {
        return self.entitity?.articleTitle
    }
    
    func getSubTitle() -> String? {
        return self.entitity?.articlePublisher
    }
    
    func getImageUrl() -> String? {
        return self.entitity?.articleImageUrl
    }
    
    func getImage() -> UIImage?{
        return UIImage.init(named: "tesla")
    }
}
