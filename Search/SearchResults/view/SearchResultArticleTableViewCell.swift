//
//  SearchResultArticleTableViewCell.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

protocol SearchResultArticleTableViewDataSource : AnyObject {
    
    func getTitle() -> String?
    func getSubTitle() -> String?
    func getImageUrl() -> String?
    func getImage() -> UIImage?
    
}

class SearchResultArticleTableViewCell: AppTableViewCell {
    
    //Metrics
    private let imageViewHeight : CGFloat = 65
    
    //View
    private let leftImageView : UIImageView = .init()
    private let textContainer : UIView = .init()
    private let titleLabel : UILabel = .init()
    private let subTitleLabel : UILabel = .init()
    private let moreButton : UIButton = UIButton.init(type: UIButton.ButtonType.system)
    
    //Data
    private weak var dataSource : SearchResultArticleTableViewDataSource?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDefaults()
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDefaults(){
        contentView.backgroundColor = UIColor.background()
    }
    
    func createViews(){
        leftImageView.contentMode = .scaleAspectFill
        contentView.addSubview(leftImageView)
        leftImageView.alignTopTo(contentView, constant: AppMetrics.verticalPadding)
        leftImageView.alignLeadingTo(contentView, constant: AppMetrics.sidePadding)
        leftImageView.setSize(CGSize.init(width: imageViewHeight, height: imageViewHeight))
        leftImageView.alignBottomTo(contentView, constant: AppMetrics.verticalPadding)
        
        moreButton.tintColor = UIColor.moreButton()
        moreButton.setImage(UIImage.init(named: "dots-horizontal"), for: .normal)
        contentView.addSubview(moreButton)
        moreButton.alignTrailingTo(contentView, constant: AppMetrics.sidePadding)
        moreButton.alignCenterYTo(leftImageView, offset: 0)
        
        contentView.addSubview(textContainer)
        textContainer.alignAfter(leftImageView, constant: AppMetrics.sidePadding)
        textContainer.alignBefore(moreButton, constant: AppMetrics.sidePadding)
        textContainer.alignCenterYTo(leftImageView, offset: 0)
        
        titleLabel.textColor = UIColor.title()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        textContainer.addSubview(titleLabel)
        titleLabel.alignTopTo(textContainer, constant: 0)
        titleLabel.alignLeadingTo(textContainer, constant: 0)
        titleLabel.alignTrailingTo(textContainer, constant: 0)
        
        subTitleLabel.textColor = UIColor.subTitle()
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        textContainer.addSubview(subTitleLabel)
        subTitleLabel.alignBelowTo(titleLabel, constant: AppMetrics.textSeparationPadding)
        subTitleLabel.alignLeadingTo(textContainer, constant: 0)
        subTitleLabel.alignTrailingTo(textContainer, constant: 0)
        subTitleLabel.alignBottomTo(textContainer, constant: 0)
    }
    
    public func setDataSource(_ dataSource : SearchResultArticleTableViewDataSource?){
        guard let dataSource = dataSource else {
            return
        }
        leftImageView.image = dataSource.getImage()
        titleLabel.text = dataSource.getTitle()
        subTitleLabel.text = dataSource.getSubTitle()
    }
}
