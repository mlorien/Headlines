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

class IntroViewController: UIViewController {

    var headlines: [Headline]!
    var disposeBag = DisposeBag()
//    var animationView: LOT
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func addAnimation() {
//        animationView = LOTAnimationView(contentsOf: url)
//        animationView.frame.size = CGSize(width: 90, height: 90)
//        animationView.contentMode = .scaleAspectFill
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
        guard let destination = segue.destination as? UINavigationController else { return }
        guard let tableVC = destination.children.first as? HeadlinesTableViewController else { return }
        tableVC.headlines = headlines
    }

}
