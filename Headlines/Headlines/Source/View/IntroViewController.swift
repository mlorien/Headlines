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

    @IBOutlet weak var stackVie: UIStackView!
    
    var headlines: [Headline]!
    var disposeBag = DisposeBag()
    var animationView: AnimationView!
    
    override func viewDidAppear(_ animated: Bool) {
        addAnimation()
        getHeadlines()
    }
    
    fileprivate func addAnimation() {
        animationView = AnimationView(url: R.file.loading2Json()!, closure: { (_) in

        })
        animationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        animationView.contentMode = .scaleAspectFill
        stackVie.addArrangedSubview(animationView)
        self.animationView.play(fromProgress: 0, toProgress: 0.8, loopMode: .loop) { (_) in
            
        }
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
