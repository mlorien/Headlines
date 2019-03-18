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
    
    @IBOutlet var contentView: UIView!
    
    var headlines: [Headline]!
    var selectedURL: String!
    
    let disposeBag = DisposeBag()
    let lighterGray = "EDF6F7".toUIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = lighterGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? WebContentViewController else { return }
        destination.url = selectedURL
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
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = WebContentViewController()
        webVC.url = headlines[indexPath.row].url
        navigationController?.pushViewController(webVC, animated: true)
    }

}
