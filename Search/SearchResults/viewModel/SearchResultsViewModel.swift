//
//  SearchResultsViewModel.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import Foundation

protocol SearchResultsViewModelDelegate : AnyObject {
    
    func refreshView()
    func resignSearchResponder()
    func didRemoveRecentSearchAtIndex(_ index : Int)
    func setSearchQuery(_ searchQuery : String)
    
}

class SearchResultsViewModel: NSObject {
    
    enum Sections : Int {
        case recentSearches //Only to be shown when user is not searching
        case topResults
        case articles
        case playlists
        case playlistsGrid2
        case playlistsGrid3
        case count
    }
    
    var recentSearches : [RecentSearchEntity] = []
    var topSearches : [SearchResultEntity] = []
    var articles : [SearchResultEntity] = []
    public weak var delegate : SearchResultsViewModelDelegate?
    var searchQuery : String?
    
    override init() {
        topSearches.append(SearchResultEntity.init())
        
        articles.append(SearchResultEntity.init())
        articles.append(SearchResultEntity.init())
        articles.append(SearchResultEntity.init())
        articles.append(SearchResultEntity.init())
    }
    
    public func searchQueryChanged(_ searchQuery : String?){
        self.searchQuery = searchQuery
        self.delegate?.refreshView()
    }
    
    public func getNumberOfRowsInSection(_ section : Int) -> Int{
        switch section {
        case SearchResultsViewModel.Sections.recentSearches.rawValue:
            if(isSearching(searchQuery)){
                return 0
            }
            return recentSearches.count
        case SearchResultsViewModel.Sections.topResults.rawValue:
            if(isSearching(searchQuery)){
                 return topSearches.count
            }
            return 0
        case SearchResultsViewModel.Sections.articles.rawValue:
            if(isSearching(searchQuery)){
                return articles.count
            }
            return 0
        case SearchResultsViewModel.Sections.playlists.rawValue:
            if(isSearching(searchQuery)){
                return 1
            }
            return 0
        case SearchResultsViewModel.Sections.playlistsGrid2.rawValue:
            if(isSearching(searchQuery)){
                return 1
            }
            return 0
        case SearchResultsViewModel.Sections.playlistsGrid3.rawValue:
            if(isSearching(searchQuery)){
                return 1
            }
            return 0
        default:
            return 0
        }
    }
    
     public func getHeaderTextForSection(_ section : Int) -> String?{
        let headerView : SearchResultsSectionHeader = SearchResultsSectionHeader.init()
        switch section {
        case SearchResultsViewModel.Sections.recentSearches.rawValue:
            return NSLocalizedString("RECENT_SEARCHES", comment: "")
        case SearchResultsViewModel.Sections.topResults.rawValue:
            return NSLocalizedString("TOP_RESULT", comment: "")
        case SearchResultsViewModel.Sections.articles.rawValue:
            return NSLocalizedString("ARTICLES", comment: "")
        case SearchResultsViewModel.Sections.playlists.rawValue:
            return NSLocalizedString("PLAYLISTS", comment: "")
        default:
            headerView.setHeaderTitle("")
        }
        return nil
    }
    
    public func shouldShowHeaderForSection(_ section : Int) -> Bool{
        switch section {
        case SearchResultsViewModel.Sections.recentSearches.rawValue:
            return !isSearching(searchQuery)
        case SearchResultsViewModel.Sections.topResults.rawValue:
            return isSearching(searchQuery) && topSearches.count > 0
        case SearchResultsViewModel.Sections.articles.rawValue:
            return isSearching(searchQuery) && articles.count > 0
        case SearchResultsViewModel.Sections.playlists.rawValue:
            return isSearching(searchQuery)
        default:
            break
        }
        return false
    }
    
    public func getRecentSearchEntityForIndex(index : Int) -> RecentSearchEntity?{
        if (index < 0 || index >= recentSearches.count){
            return nil
        }
        let recentSearchEntity : RecentSearchEntity = recentSearches[index]
        recentSearchEntity.index = index
        return recentSearches[index]
    }
    
    public func getTopResultEntityForIndex(index : Int) -> SearchResultEntity?{
        if (index < 0 || index >= topSearches.count){
            return nil
        }
        let topSearchEntity : SearchResultEntity = topSearches[index]
        return topSearchEntity
    }
    
    public func getArticleEntityForIndex(index : Int) -> SearchResultEntity?{
        if (index < 0 || index >= articles.count){
            return nil
        }
        let articleEntity : SearchResultEntity = articles[index]
        return articleEntity
    }
    
    
    public func searchClicked(_ searchQuery : String?){
        self.searchQuery = searchQuery
        if let searchQuery = searchQuery, !searchQuery.isEmpty{
            recentSearches.append(RecentSearchEntity.init(query: searchQuery))
        }
        delegate?.refreshView()
        delegate?.resignSearchResponder()
    }
    
    public func didTapClearRecentSearchAtIndex(_ index : Int){
        recentSearches.remove(at: index)
        delegate?.didRemoveRecentSearchAtIndex(index)
    }
    
    public func didTapRecentSearchAtIndex(_ index : Int){
        if (index < 0 || index >= recentSearches.count){
            return
        }
        if let query = recentSearches[index].query{
            searchQuery = query
            delegate?.setSearchQuery(query)
            delegate?.refreshView()
        }
    }
    
    private func isSearching(_ query : String?) -> Bool{
        if let searchQuery = searchQuery, !searchQuery.isEmpty{
            return true
        }
        return false
    }
}
