//
//  IntroViewController.swift
//  Headlines
//
//  Created by Lorien Moisyn on 16/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit
import RxSwift
import Lottie
import Rswift

class IntroViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    var headlines: [Headline]!
    var disposeBag = DisposeBag()
    
    override func viewDidAppear(_ animated: Bool) {
        getHeadlines()
        stackView.addArrangedSubview(newActivityIndicator())
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
        guard let destination = segue.destination as? UINavigationController else { return }
        guard let tableVC = destination.children.first as? HeadlinesTableViewController else { return }
        tableVC.headlines = headlines
    }

}
