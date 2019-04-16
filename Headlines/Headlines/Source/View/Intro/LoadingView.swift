//
//  LoadingView.swift
//  Headlines
//
//  Created by Lorien Moisyn on 17/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    @IBOutlet var stackView: UIStackView!
    
    override func didMoveToSuperview() {
        setup()
    }
    
    private func loadFromNib() -> UIView? {
        let nibName = String(describing: self.classForCoder)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setup() {
        guard let view = loadFromNib() else { return }
        view.frame = self.bounds
        addSubview(view)
    }
    
}
