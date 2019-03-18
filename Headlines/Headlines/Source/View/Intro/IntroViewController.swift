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
    
    override func viewDidAppear(_ animated: Bool) {
        let loadingView = LoadingView()
        loadingView.frame = view.frame
        view.addSubview(loadingView)
        loadingView.stackView.addArrangedSubview(newActivityIndicator())
        
        getHeadlines()
    }
    
    fileprivate func getHeadlines() {
        AlamoRemoteSource()
            .getTopHeadlines()
            .asObservable()
            .subscribe(onNext: { headlineList in
                self.headlines = headlineList.articles
                let vc = HeadlinesTableViewController()
                vc.headlines = self.headlines
                let navigationController = UINavigationController(rootViewController: vc)
                self.present(navigationController, animated: true)
            })
            .disposed(by: disposeBag)
    }

}
