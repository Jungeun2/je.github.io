//
//  FacebookViewController.swift
//  TapbarWebView
//
//  Created by 이정은 on 2020/12/09.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit
import WebKit

class FacebookViewController: UIViewController, WKNavigationDelegate {

    let activity = UIActivityIndicatorView(style: .large)
        
        let myWebView = WKWebView(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-120))

        func loadWebPage(_ url: String) {
            let myUrl = URL(string: url)
            let myRequest = URLRequest(url: myUrl!)
            myWebView.load(myRequest)
            
            activity.center = myWebView.center
            activity.startAnimating()
            activity.hidesWhenStopped = false
            myWebView.addSubview(activity)
            self.view.addSubview(myWebView)
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            myWebView.navigationDelegate = self
            
            view.addSubview(myWebView)
            loadWebPage("https://www.facebook.com/")
        
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            activity.startAnimating()
            activity.isHidden = false
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            activity.stopAnimating()
            activity.isHidden = true
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            activity.stopAnimating()
            activity.isHidden = true
        }
        
    }
