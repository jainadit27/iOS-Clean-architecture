//
//  RecentSearchTableViewCell.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

protocol RecentSearchTableViewCellDelegate : AnyObject {
    
    func didTapClearRecentSearchAtIndex(_ index : Int)
    
}

protocol RecentSearchTableViewDataSource : AnyObject {
    
    func getTitle() -> String?
    func shouldShowTopSeparator() -> Bool
    func getIndex() -> Int
    
}

class RecentSearchTableViewCell: AppTableViewCell {
    
    //Views
    private let titleLabel : UILabel = .init()
    private let clearButton : UIButton = UIButton.init(type: UIButton.ButtonType.system)
    private let topSeparator : AppSeparator = AppSeparator.init()
    private let bottomSeparator : AppSeparator = AppSeparator.init()
    
    //Data
    private var index : Int = -1
    public weak var delegate : RecentSearchTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDefaults()
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDefaults(){
        contentView.backgroundColor = UIColor.background()
    }
    
    private func createViews(){
        contentView.addSubview(topSeparator)
        topSeparator.alignTopTo(contentView, constant: 0)
        topSeparator.alignLeadingTo(contentView, constant: AppMetrics.sidePadding)
        topSeparator.alignTrailingTo(contentView, constant: AppMetrics.sidePadding)
        
        clearButton.tintColor = UIColor.moreButton()
        clearButton.setImage(UIImage.init(named: "close-circle-outline"), for: .normal)
        clearButton.addTarget(self, action: #selector(didTapClearSearch), for: .touchUpInside)
        contentView.addSubview(clearButton)
        clearButton.alignTrailingTo(contentView, constant: AppMetrics.sidePadding)
        clearButton.alignCenterYTo(contentView, offset: 0)
        
        titleLabel.textColor = UIColor.title()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        contentView.addSubview(titleLabel)
        titleLabel.alignTopTo(contentView, constant: AppMetrics.sidePadding)
        titleLabel.alignLeadingTo(contentView, constant: AppMetrics.sidePadding)
        titleLabel.alignBefore(clearButton, constant: AppMetrics.sidePadding)
        titleLabel.alignBottomTo(contentView, constant: AppMetrics.sidePadding)
        
        contentView.addSubview(bottomSeparator)
        bottomSeparator.alignBottomTo(contentView, constant: 0)
        bottomSeparator.alignLeadingTo(contentView, constant: AppMetrics.sidePadding)
        bottomSeparator.alignTrailingTo(contentView, constant: AppMetrics.sidePadding)
    }
    
    public func setDataSource(_ dataSource : RecentSearchTableViewDataSource?){
        guard let dataSource = dataSource else {
            return
        }
        titleLabel.text = dataSource.getTitle()
        topSeparator.isHidden = !dataSource.shouldShowTopSeparator()
        index = dataSource.getIndex()
    }
    
    @objc public func didTapClearSearch(){
        delegate?.didTapClearRecentSearchAtIndex(index)
    }
    
}
