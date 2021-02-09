//
//  WriteViewController.swift
//  AccountBook
//
//  Created by 이정은 on 2020/12/15.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit
import WebKit

class WriteViewController: UIViewController, WKNavigationDelegate {
    
    
//    let userAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"
    
    override func loadView() {
        super.loadView()
        
        initWebView()
    }
    
    var myWebView = WKWebView()
    
    func initWebView() {

         myWebView = WKWebView(frame: CGRect(x: 0,
                                            y: 45,
                                            width: UIScreen.main.bounds.width,
                                            height: UIScreen.main.bounds.height-128))
//    , configuration: getWebViewConfiguration()
    }
//
//    func getWebViewConfiguration() -> WKWebViewConfiguration {
//
//        let wkWebViewConfiguration = WKWebViewConfiguration()
//        wkWebViewConfiguration.applicationNameForUserAgent = userAgent
//        return wkWebViewConfiguration

//    }
    
    static let MAIN_URL = "http://localhost:8080/templates/write.html"
    
    func loadWebPage(_ url: String) {
        
        let config = URLSessionConfiguration.default
        let defaultSession = URLSession(configuration: config)
        let request = URLRequest(url: URL(string: WriteViewController.MAIN_URL)!)
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
        
//        let myUrl = URL(string: url)
//        let myRequest = URLRequest(url: myUrl!)
        
        myWebView.load(request)
        
        self.view.addSubview(myWebView)
        
    }
    
//    override func loadView() {
//        super.loadView()
//
//        let contentController = WKUserContentController()
//        let config = WKWebViewConfiguration()
//
//        let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
//        contentController.addUserScript(userScript)
//
//        contentController.add(self, name: "callbackHandler")
//
//        config.userContentController = contentController
//
//        myWebView.uiDelegate = self
//        myWebView.navigationDelegate = self
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebPage("http://localhost:8080/templates/write.html")
        
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
    
    @IBAction func btnWritePage(_ sender: Any) {
//        let test = self.storyboard?.instantiateViewController(identifier: "ReportViewController")
//        test?.modalTransitionStyle = .coverVertical
//        self.present(test!, animated: true, completion: nil)
    }
    
    @IBAction func btnReportPage(_ sender: Any) {
    }
    
    @IBAction func btnBudgetPage(_ sender: Any) {
    }
    
    @IBAction func btnFreeWritePage(_ sender: Any) {
    }
}
