//
//  SearchResultsPlaylistCollectionViewCell.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class SearchResultsPlaylistCollectionViewCell: UICollectionViewCell {

    //Metrics
    private let progressViewHeight : CGFloat = 6
    private var heightConstraint : NSLayoutConstraint?
    
    //View
    private let containerView : UIView = .init()
    private let topImageView : UIImageView = .init()
    private let gradientView : UIView = .init()
    private let gradientLayer : CAGradientLayer = .init()
    private let progressView : UIView = .init()
    private let titleLabel : UILabel = .init()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaults()
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setDefaults(){
        backgroundColor = UIColor.background()
        contentView.backgroundColor = UIColor.background()
    }
    
    func createViews(){
        contentView.addSubview(containerView)
        containerView.alignEqualTo(contentView)
        
        topImageView.contentMode = .scaleAspectFill
        topImageView.clipsToBounds = true
        topImageView.layer.masksToBounds = false
        topImageView.layer.shadowRadius = 14
        topImageView.layer.shadowOpacity = 1
        topImageView.layer.shadowOffset = CGSize.zero
        topImageView.layer.shadowColor = UIColor.shadow().cgColor
        containerView.addSubview(topImageView)
        topImageView.image = UIImage.init(named: "tesla")
        topImageView.alignTopTo(containerView, constant: 0)
        topImageView.alignLeadingTo(containerView, constant: 0)
        topImageView.alignTrailingTo(containerView, constant: 0)
        heightConstraint = topImageView.setHeight(0)
        
        topImageView.addSubview(gradientView)
        gradientView.alignEqualTo(topImageView)
        
        gradientLayer.colors = UIColor.imageGradient()
        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.1, y: 1)
        gradientLayer.locations = [0,0.85]
        gradientLayer.frame = self.topImageView.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        
        progressView.backgroundColor = UIColor.primary()
        topImageView.addSubview(progressView)
        progressView.alignLeadingTo(topImageView, constant: 0)
        progressView.alignTrailingTo(topImageView, constant: 3*AppMetrics.sidePadding)
        progressView.alignBottomTo(topImageView, constant: 0)
        progressView.setHeight(progressViewHeight)
        
        titleLabel.text = "Electric Vehiclesasdjhavshjdvasdvjasvdhjasvhjvahj"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = UIColor.black()
        titleLabel.numberOfLines = 0
        containerView.addSubview(titleLabel)
        titleLabel.alignBelowTo(topImageView, constant: AppMetrics.sidePadding/2)
        titleLabel.alignLeadingTo(containerView, constant: AppMetrics.sidePadding/2)
        titleLabel.alignTrailingTo(containerView, constant: AppMetrics.sidePadding/2)
        
        let spacerView : UIView = .init()
        containerView.addSubview(spacerView)
        spacerView.alignBelowTo(titleLabel, constant: 0)
        spacerView.alignLeadingTo(topImageView, constant: 0)
        spacerView.alignTrailingTo(topImageView, constant: 0)
        spacerView.alignBottomTo(containerView, constant: 0)
    }
    
    public func setData( _ height : CGFloat, text : String){
        heightConstraint?.constant = height
        titleLabel.text = text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer.frame = self.topImageView.bounds
    }
    
    public static func height(forWidth width: CGFloat, imageHeight : CGFloat, maxText : String) -> CGFloat {
        let sizingCell = SearchResultsPlaylistCollectionViewCell.init()
        sizingCell.prepareForReuse()
        sizingCell.setData(imageHeight, text: maxText)
        sizingCell.layoutIfNeeded()
        var fittingSize = UIView.layoutFittingCompressedSize
        fittingSize.width = width
        let size = sizingCell.contentView.systemLayoutSizeFitting(fittingSize,
                                                                  withHorizontalFittingPriority: .required,
                                                                  verticalFittingPriority: .defaultLow)
        
        return size.height
    }
    
}
