//
//  FirstViewController.swift
//  Headlines
//
//  Created by Lorien Moisyn on 14/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit
import RxSwift

class HeadlinesTableViewController: UIViewController  {
    
    var headlines: [Headline]!
    var filteredHeadlines: [Headline] = []
    var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    let lighterGray = "EDF6F7".toUIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        filteredHeadlines = headlines
        setupTableView()
        addSearchBar()
    }
    
    fileprivate func setupTableView() {
        tableView = UITableView()
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = lighterGray
        view.addSubview(tableView)
        tableView.reloadData()
    }
    
    fileprivate func addSearchBar() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.barTintColor = .black
        navigationItem.titleView = searchBar
    }

}

extension HeadlinesTableViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredHeadlines.count//filteredHeadlines.isEmpty ? headlines.count : filteredHeadlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HeadlineCell()
        cell.setup(with: filteredHeadlines[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = WebContentViewController()
        webVC.url = filteredHeadlines[indexPath.row].url
        navigationController?.pushViewController(webVC, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.isEmpty else {
            filteredHeadlines = headlines.filter{ $0.title.contains(searchText) }
            tableView.reloadData()
            return
        }
        filteredHeadlines = headlines
        tableView.reloadData()
    }

}
