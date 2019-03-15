//
//  FirstViewController.swift
//  Headlines
//
//  Created by Lorien Moisyn on 14/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit
import RxSwift

class HeadlinesTableViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        AlamoRemoteSource()
            .getTopHeadlines()
            .asObservable()
            .subscribe { (content) in
                print(content)
            }.disposed(by: disposeBag)
    }

}
