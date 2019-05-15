//
//  AppSearchBar.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class AppSearchBar: UISearchBar, UISearchBarDelegate {
    
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
        self.barStyle = .default
        self.delegate = self
        self.isTranslucent = true
        self.searchBarStyle = .minimal
        self.barTintColor = UIColor.white()
        self.tintColor = UIColor.primary()
        self.backgroundImage = UIImage.init(color: UIColor.transparent(), size: CGSize.init(width: 1, height: 1))
        self.setTextColor(color: UIColor.searchBarText())
        self.setTextFont(font: UIFont.systemFont(ofSize: CGFloat.init(integerLiteral: 17), weight: UIFont.Weight.regular))
        
        //Cancel button
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primary(), NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat.init(integerLiteral: 17), weight: UIFont.Weight.regular)]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
         searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
