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
    
    let disposeBag = DisposeBag()
    var headlines: [Headline]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor = "1F2833".toUIColor()
    }
    
    fileprivate func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

}

extension HeadlinesTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HeadlineCell()
        cell.setup(with: headlines[indexPath.row], even: indexPath.row % 2 == 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
