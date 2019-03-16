//
//  IntroViewController.swift
//  Headlines
//
//  Created by Lorien Moisyn on 16/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit
import RxSwift

class IntroViewController: UIViewController {

    var headlines: [Headline]!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getHeadlines()
    }
    
    fileprivate func getHeadlines() {
        AlamoRemoteSource()
            .getTopHeadlines()
            .asObservable()
            .subscribe(onNext: { headlineList in
                self.headlines = headlineList.articles
                self.performSegue(withIdentifier: "show", sender: Any?.self)
            })
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? HeadlinesTableViewController else { return }
        destination.headlines = headlines
    }

}
