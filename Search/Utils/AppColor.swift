//
//  AppColor.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    static func white() -> UIColor{
        return .init(netHex: 0xFFFFFF)
    }
    
    static func black() -> UIColor{
        return .init(netHex: 0x000000)
    }
    
    static func primary() -> UIColor{
        return .init(netHex: 0xFF3267)
    }
    
    static func title() -> UIColor{
        return .init(netHex: 0x636363)
    }
    
    static func moreButton() -> UIColor{
        return .init(netHex: 0x636363)
    }
    
    static func subTitle() -> UIColor{
        return .init(netHex: 0x878787)
    }
    
    static func searchBarText() -> UIColor{
        return .init(netHex: 0x8E8E93)
    }
    
    static func searchBarBackground() -> UIColor{
        return searchBarText().withAlphaComponent(0.24)
    }
    
    static func transparent() -> UIColor{
        return white().withAlphaComponent(0)
    }
    
    static func shadow() -> UIColor{
        return black().withAlphaComponent(0.3)
    }
    
    static func headerBackground() -> UIColor{
        return .init(netHex: 0xF3F3F3)
    }
    
    static func background() -> UIColor{
        return .init(netHex: 0xFBFBFB)
    }
    
    static func separator() -> UIColor{
        return .init(netHex: 0xDFDFE0)
    }
    
    static func headerGradient() -> [CGColor]{
        return [ white().cgColor,headerBackground().cgColor]
    }
    
    static func imageGradient() -> [CGColor]{
        return [ transparent().cgColor,black().cgColor]
    }
}

