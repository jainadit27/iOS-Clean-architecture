//
//  AppMetrics.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

struct AppMetrics {
    
    private static let notchHeight : CGFloat = 24
    
    static let sidePadding : CGFloat = 16
    static let searchBarSidePadding : CGFloat = 8
    static let verticalPadding : CGFloat = 16
    static let searchBarVerticalPadding : CGFloat = 8
    static let textSeparationPadding : CGFloat = 8
    static let gridSpacing : CGFloat = 24
    
    static func statusBarHeight() -> CGFloat{
        if(UIDevice.current.hasNotch){
            return UIApplication.shared.statusBarFrame.height + notchHeight
        }
        return UIApplication.shared.statusBarFrame.height
    }
    
    static func screenWidth() -> CGFloat{
        return UIScreen.main.bounds.width
    }
    
    static func screenHeight() -> CGFloat{
        return UIScreen.main.bounds.height
    }
}
