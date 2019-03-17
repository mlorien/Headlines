//
//  WebContentViewController.swift
//  Headlines
//
//  Created by Lorien Moisyn on 17/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit
import WebKit

class WebContentViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
