//
//  SearchResultsViewController.swift
//  Search
//
//  Created by Aditya Jain on 1/18/19.
//  Copyright © 2019 Zomato. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController{
    
    //Views
    let searchBarHeader : AppSearchBarHeader = AppSearchBarHeader.init()
    let tableView : UITableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    
    //Data
    var searchViewModel : SearchResultsViewModel = SearchResultsViewModel.init()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        searchViewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaults()
        createViews()
    }
    
    private func setDefaults(){
        view.backgroundColor = UIColor.background()
    }
    
    private func createViews(){
        searchBarHeader.searchBar.placeholder = "Search"
        searchBarHeader.searchBar.delegate = self
        view.addSubview(searchBarHeader)
        searchBarHeader.alignTopTo(view, constant: -AppMetrics.statusBarHeight())
        searchBarHeader.alignLeadingTo(view, constant: 0)
        searchBarHeader.alignTrailingTo(view, constant: 0)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = UIColor.background()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        tableView.alignBelowTo(searchBarHeader, constant: 0)
        tableView.alignLeadingTo(view, constant: 0)
        tableView.alignTrailingTo(view, constant: 0)
        tableView.alignBottomTo(view, constant: 0)
    }
}

extension SearchResultsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SearchResultsViewModel.Sections.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.getNumberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case SearchResultsViewModel.Sections.recentSearches.rawValue:
            let reuseIdentifier = "recentSearchCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? RecentSearchTableViewCell
            if cell == nil {
                cell = RecentSearchTableViewCell.init(style: .default, reuseIdentifier: reuseIdentifier)
            }
            cell?.delegate = self
            if let recentSearchEntity : RecentSearchEntity = searchViewModel.getRecentSearchEntityForIndex(index: indexPath.row){
                cell?.setDataSource(RecentSearchViewModel.init(recentSearchEntity))
                return cell!
            }
        case SearchResultsViewModel.Sections.topResults.rawValue:
            let reuseIdentifier = "topResultsCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SearchResultArticleTableViewCell
            if cell == nil {
                cell = SearchResultArticleTableViewCell.init(style: .default, reuseIdentifier: reuseIdentifier)
            }
            if let searchEntity : SearchResultEntity = searchViewModel.getTopResultEntityForIndex(index: indexPath.row){
                cell?.setDataSource(SearchResultArticleViewModel.init(searchEntity))
                return cell!
            }
        case SearchResultsViewModel.Sections.articles.rawValue:
            let reuseIdentifier = "articleCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SearchResultArticleTableViewCell
            if cell == nil {
                cell = SearchResultArticleTableViewCell.init(style: .default, reuseIdentifier: reuseIdentifier)
            }
            if let articleEntity : SearchResultEntity = searchViewModel.getArticleEntityForIndex(index: indexPath.row){
                cell?.setDataSource(SearchResultArticleViewModel.init(articleEntity))
                return cell!
            }
        case SearchResultsViewModel.Sections.playlists.rawValue:
            let reuseIdentifier = "playListCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SearchResultsPlaylistTableViewCell
            if cell == nil {
                cell = SearchResultsPlaylistTableViewCell.init(mode: .carousel, reuseIdentifier: "playListCell")
            }
            return cell!
        case SearchResultsViewModel.Sections.playlistsGrid2.rawValue:
            let reuseIdentifier = "playListCell2"
            var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SearchResultsPlaylistTableViewCell
            if cell == nil {
                cell = SearchResultsPlaylistTableViewCell.init(mode: .grid2, reuseIdentifier: "playListCell2")
            }
            return cell!
        case SearchResultsViewModel.Sections.playlistsGrid3.rawValue:
            let reuseIdentifier = "playListCell3"
            var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SearchResultsPlaylistTableViewCell
            if cell == nil {
                cell = SearchResultsPlaylistTableViewCell.init(mode: .grid3, reuseIdentifier: "playListCell3")
            }
            return cell!
        default:
            break
        }
        return AppEmptyTableViewCell.init(style: .default, reuseIdentifier: "emptyCell")
    }
}

extension SearchResultsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let headerView : SearchResultsSectionHeader = SearchResultsSectionHeader.init()
        headerView.setHeaderTitle(searchViewModel.getHeaderTextForSection(section))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if(searchViewModel.shouldShowHeaderForSection(section)){
            return UITableView.automaticDimension
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.section == SearchResultsViewModel.Sections.recentSearches.rawValue){
            searchViewModel.didTapRecentSearchAtIndex(indexPath.row)
        }
    }
    
}

extension SearchResultsViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.searchQueryChanged(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchViewModel.searchClicked(searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchViewModel.searchClicked(nil)
    }
    
}

extension SearchResultsViewController : SearchResultsViewModelDelegate{
    
    func refreshView(){
        self.tableView.reloadData()
    }
    
    func resignSearchResponder(){
        self.searchBarHeader.searchBar.resignFirstResponder()
    }
    
    func didRemoveRecentSearchAtIndex(_ index : Int){
        self.tableView.deleteRows(at: [IndexPath.init(row: index, section: SearchResultsViewModel.Sections.recentSearches.rawValue)], with: UITableView.RowAnimation.automatic)
        self.tableView.reloadData()
    }
    
    func setSearchQuery(_ searchQuery: String) {
        self.searchBarHeader.searchBar.text = searchQuery
    }
}

extension SearchResultsViewController: RecentSearchTableViewCellDelegate{
    
    func didTapClearRecentSearchAtIndex(_ index: Int) {
        searchViewModel.didTapClearRecentSearchAtIndex(index)
    }
    
}
