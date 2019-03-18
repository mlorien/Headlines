//
//  WebContentViewController.swift
//  Headlines
//
//  Created by Lorien Moisyn on 17/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit
import WebKit

class WebContentViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    var url: String!
    var activyIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activyIndicator = newActivityIndicator()
        activyIndicator.color = .black
        webView.addSubview(activyIndicator)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activyIndicator.removeFromSuperview()
    }
    
    @IBAction func shareContent(_ sender: Any) {
        let items = [URL(string: url)!]
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(vc, animated: true)
    }

}
