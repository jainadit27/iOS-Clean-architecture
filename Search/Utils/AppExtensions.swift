//
//  AppExtensions.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

public extension UISearchBar {
    
    public func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
    
    public func setTextFont(font: UIFont) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.font = font
    }
}

extension UIDevice {
    
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

extension UIView {

    func alignTopTo( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
    }
    
    func alignBelowTo( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    func alignAboveTo( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -constant).isActive = true
    }
    
    func alignLeadingTo( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    func alignAfter( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
    }
    
    func alignTrailingTo( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
    }
    
    func alignBefore( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -constant).isActive = true
    }
    
    func alignBottomTo( _ view : UIView, constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
    }
    
    func alignCenterXTo( _ view : UIView, offset : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset).isActive = true
    }
    
    func alignCenterYTo( _ view : UIView, offset : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset).isActive = true
    }
    
    func alignEqualTo( _ view : UIView){
        alignTopTo(view, constant: 0)
        alignLeadingTo(view, constant: 0)
        alignTrailingTo(view, constant: 0)
        alignBottomTo(view, constant: 0)
    }
    
    func setSize(_ size : CGSize){
        setHeight(size.height)
        setWidth(size.width)
    }
    
    @discardableResult func setHeight(_ constant : CGFloat) -> NSLayoutConstraint{
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    func setWidth(_ constant : CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
}
