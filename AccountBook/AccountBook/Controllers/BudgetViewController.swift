//
//  BudgetViewController.swift
//  AccountBook
//
//  Created by 이정은 on 2020/12/15.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit
import WebKit

class BudgetViewController: UIViewController, WKNavigationDelegate {
    
    static let MAIN_URL = "http://localhost:8080/templates/budget.html"
           
        let myWebView = WKWebView(frame: CGRect(x: 0,
                                                   y: 45,
                                                   width: UIScreen.main.bounds.width,
                                                   height: UIScreen.main.bounds.height-128))
           
        func loadWebPage(_ url: String) {
               
        let config = URLSessionConfiguration.default
        let defaultSession = URLSession(configuration: config)
        let request = URLRequest(url: URL(string: BudgetViewController.MAIN_URL)!)
        let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                guard error == nil else {
                    print("Error occur: \(String(describing: error))")
                    return
                }
                guard let _ = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    return
                }
            }
            dataTask.resume()
    
        myWebView.load(request)
        
        self.view.addSubview(myWebView)
               
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebPage("http://localhost:8080/templates/budget.html")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func btnGoBack(_ sender: Any) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForword(_ sender: Any) {
        myWebView.goForward()
    }
    
    @IBAction func btnReload(_ sender: Any) {
        myWebView.reload()
    }
    
    @IBAction func btnStop(_ sender: Any) {
        myWebView.stopLoading()
    }
}
