//
//  UIViewController+Additions.swift
//  Headlines
//
//  Created by Lorien Moisyn on 17/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func newActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator.center = view.center
        indicator.style = .whiteLarge
        indicator.startAnimating()
        return indicator
    }
    
}
