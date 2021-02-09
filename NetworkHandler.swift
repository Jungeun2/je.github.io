//
//  NetworkHandler.swift
//  AccountBook
//
//  Created by 이정은 on 2020/12/22.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import Foundation

class NetworkHandler {
    
//    static let MAIN_URL = "http://localhost:8080/templates/write.html"
    
    static let MAIN_URL = "http://localhost:8080"
    
    class func initialize () {
        // 세션 생성, 환경설정
        let config = URLSessionConfiguration.default
        let defaultSession = URLSession(configuration: config)
        let request = URLRequest(url: URL(string: MAIN_URL)!)
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
    }

}
