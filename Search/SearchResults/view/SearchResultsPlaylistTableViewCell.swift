//
//  SearchResultsPlaylistTableViewCell.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class SearchResultsPlaylistTableViewCell: AppTableViewCell,
    UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource,
UICollectionViewDelegate{
    
    public enum DisplayMode{
        case carousel
        case grid2
        case grid3
    }
    
    let array = ["If you found this site, we may", "If you found this site", "If you found", "If", "If you found this site, we may have something in common","If you found this site, we may", "If you found this site", "If you found", "If", "If you found this site, we may have something in common"]
    var imageHeight =  CGFloat.zero
    var displayMode = DisplayMode.carousel
    let collectionViewLayout = UICollectionViewFlowLayout()
    var cellHeight : CGFloat = 0
    //View
    let collectionView : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    init(mode: DisplayMode, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.displayMode = mode
        setDefaults()
        createViews()
        setData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDefaults(){
        contentView.backgroundColor = UIColor.background()
        backgroundColor = UIColor.background()
    }
    
    func createViews(){
        switch displayMode {
        case .carousel:
            collectionViewLayout.scrollDirection = .horizontal
            collectionView.isScrollEnabled = true
            break
        case .grid2:
            collectionViewLayout.scrollDirection = .vertical
            collectionView.isScrollEnabled = false
            break
        case .grid3:
            collectionViewLayout.scrollDirection = .vertical
            collectionView.isScrollEnabled = false
            break
        }
        collectionViewLayout.minimumLineSpacing = AppMetrics.sidePadding
        collectionViewLayout.minimumInteritemSpacing = AppMetrics.sidePadding
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: AppMetrics.sidePadding, bottom: 0, right: AppMetrics.sidePadding)
        collectionView.backgroundColor = UIColor.background()
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.register(SearchResultsPlaylistCollectionViewCell.self, forCellWithReuseIdentifier: "SearchResultsPlaylistCollectionViewCell")
        
        contentView.addSubview(collectionView)
        collectionView.alignEqualTo(contentView)
    }
    
    func setData(){
        var width :  CGFloat = 0
        switch displayMode {
        case .carousel:
            width = 0.4*AppMetrics.screenWidth()
            break
        case .grid2:
            width = (AppMetrics.screenWidth() - 3*AppMetrics.sidePadding)/2
            break
        case .grid3:
            width = (AppMetrics.screenWidth() - 4*AppMetrics.sidePadding)/3
            break
        }
        imageHeight = width
        cellHeight = SearchResultsPlaylistCollectionViewCell.height(forWidth: width, imageHeight: imageHeight, maxText: array[4])
        collectionViewLayout.itemSize = CGSize(width: width, height: cellHeight)
        switch displayMode {
        case .carousel:
            collectionView.setHeight(2*cellHeight + AppMetrics.sidePadding)
            break
        case .grid2:
            collectionView.setHeight(cellHeight * CGFloat.init(array.count/2))
            break
        case .grid3:
             collectionView.setHeight(cellHeight * CGFloat.init(array.count/2 + 1))
            break
        }
        collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cv = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchResultsPlaylistCollectionViewCell", for: indexPath) as! SearchResultsPlaylistCollectionViewCell
        cv.setData(imageHeight, text: array[indexPath.row])
        return cv
    }
}
