//
//  NetworkHandler.swift
//  Community
//
//  Created by 이정은 on 2020/09/16.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import Foundation

class NetworkHandler {
    
    static let MAIN_URL = "http://localhost:8080"
    
    class func initialize () {
        // 세션 생성, 환경설정
        let config = URLSessionConfiguration.default
//        config.httpAdditionalHeaders = ["User-Agent": "smc"]
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
    
    
    /* ------------------------- 게시판 리스트 ------------------------- */
    
    class func getBoardList(_ completeHandler: @escaping ([BoardList]?) -> Void) {
        
        let BoardView: String = MAIN_URL + "/board/boardList"
        guard let url = URL(string: BoardView) else {
          print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
            print("error calling GET on /todos/1")
            print(error!)
                return
            }

            guard let responseData = data else {
            print("Error: did not receive data")
                return
            }

            do {
                let decoder = JSONDecoder.init()
                let BoardValue = try decoder.decode([BoardList].self, from: responseData)
                completeHandler(BoardValue)
                
            }
            catch {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
    
    /* ------------------------- 인기 게시물 목록 ------------------------- */
    
    class func getRankList(_ completeHandler: @escaping ([BoardRank]?) -> Void) {
        
        let BoardView: String = MAIN_URL + "/board/rank"
        guard let url = URL(string: BoardView) else {
          print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
            print("error calling GET on /todos/1")
            print(error!)
                return
            }

            guard let responseData = data else {
            print("Error: did not receive data")
                return
            }

            do {
                let decoder = JSONDecoder.init()
                let rankValue = try decoder.decode([BoardRank].self, from: responseData)
                completeHandler(rankValue)
                
            }
            catch {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
    
    /* ------------------------- 게시판 상세보기 ------------------------- */
    
    class func DetailBoard(_ completeHandler: @escaping (BoardView) -> Void, b_id: Int) {
        let DetailView: String = MAIN_URL + "/board/view/\(b_id)"
        guard let url = URL(string: DetailView) else {
          print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
            print("error calling GET on /todos/1")
            print(error!)
                return
            }

            guard let responseData = data else {
            print("Error: did not receive data")
                return
            }

            do {
                let decoder = JSONDecoder.init()
                let ViewList = try decoder.decode(BoardView.self, from: responseData)
                completeHandler(ViewList)
            }
            catch {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
    
    
    /* ------------------------- 게시판 댓글보기 ------------------------- */
    
//    class func getComment(_ completeHandler: @escaping ([comment]) -> Void, b_id: Int) {
//        let CommentView: String = MAIN_URL + "/comment/\(b_id)"
//        guard let url = URL(string: CommentView) else {
//          print("Error: cannot create URL")
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: urlRequest) { (data, response, error) in
//            guard error == nil else {
//            print("error calling GET on /todos/1")
//            print(error!)
//                return
//            }
//
//            guard let responseData = data else {
//            print("Error: did not receive data")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder.init()
//                let CommnetList = try decoder.decode([comment].self, from: responseData)
//                completeHandler(CommnetList)
//            }
//            catch {
//                print("error trying to convert data to JSON")
//                return
//            }
//        }
//        task.resume()
//    }
    
    /* ------------------------- 게시판 댓글보기 ------------------------- */
        
        class func getComment(_ completeHandler: @escaping ([ViewComments]) -> Void, b_id: Int) {
            let CommentView: String = MAIN_URL + "/board/view/\(b_id)"
            guard let url = URL(string: CommentView) else {
              print("Error: cannot create URL")
                return
            }
            
            let urlRequest = URLRequest(url: url)
            let session = URLSession.shared
    
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                    return
                }
    
                guard let responseData = data else {
                print("Error: did not receive data")
                    return
                }
    
                do {
                    let decoder = JSONDecoder.init()
                    let CommnetList = try decoder.decode([ViewComments].self, from: responseData)
                    completeHandler(CommnetList)
                }
                catch {
                    print("error trying to convert data to JSON")
                    return
                }
            }
            task.resume()
        }
    
    
    /* ------------------------- 게시판 로그인 ------------------------- */
        
        class func loginBoard(_ completeHandler: @escaping (Login) -> Void, param: String) {
            let loginboard: String = MAIN_URL + "/member/login"
            guard let url = URL(string: loginboard) else {
              print("Error: cannot create URL")
                return
            }
            let param = param
            let controller = LoginViewController()
            let paramData = param.data(using: .utf8)

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = paramData
//            urlRequest.httpBody = try JSONEncoder().encode(Login)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
            
            controller.param = param
//            print("this is api param !!!!!!! : ", param)
            print("url is ---> \(url)")
            let session = URLSession.shared
            // URLSession 객체를 통해 전송, 응답값 처리
                let task = session.dataTask(with: urlRequest) { (data, response, error) in
            // 서버가 응답이 없거나 통신이 실패
                if let e = error {
                    NSLog("An error has occured: \(e.localizedDescription)")
                        return
                }
            // 응답 처리 로직
                DispatchQueue.main.async() {
            // 서버로부터 응답된 스트링 표시
                let outputStr = String(data: data!, encoding: String.Encoding.utf8)
                    print("result: \(outputStr!)")
                    print("this is api param !!!!!!! : ", param)
                }
            }
            // POST 전송
                task.resume()
        }


    /* ------------------------- 게시판 회원가입 ------------------------- */
    
    class func SignUpBoard(_ completeHandler: @escaping (signUp) -> Void) {
        let SignUp: String = MAIN_URL + "/member/signUp"
        guard let url = URL(string: SignUp) else {
          print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
            print("error calling Post on /todos/1")
            print(error!)
                return
            }

            guard let responseData = data else {
            print("Error: did not receive data")
                return
            }

            do {
                let decoder = JSONDecoder.init()
                let signupList = try decoder.decode(signUp.self, from: responseData)
                completeHandler(signupList)
            }
            catch {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
}
    
    
    
    
    
    
    
    
//    class func DeleteBoard(_ completeHandler: @escaping (BoardView) -> Void, b_id: Int) {
//        let DetailView: String = MAIN_URL + "/board/community/\(b_id)"
//        guard let url = URL(string: DetailView) else {
//          print("Error: cannot create URL")
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: urlRequest) { (data, response, error) in
//            guard error == nil else {
//            print("error calling GET on /todos/1")
//            print(error!)
//                return
//            }
//
//            guard let responseData = data else {
//            print("Error: did not receive data")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder.init()
//                let ViewList = try decoder.decode(BoardView.self, from: responseData)
//                completeHandler(ViewList)
//            }
//            catch {
//                print("error trying to convert data to JSON")
//                return
//            }
//        }
//        task.resume()
//    }

/*  로그인 하기 위한 userAgent of NSURLConnection
let userAgent = "smc"
if let userUrl = NSURL(string: todoEndpoint) {
    let userRequest = NSMutableURLRequest(url: (userUrl as NSURL) as URL)
   userRequest.setValue(userAgent, forHTTPHeaderField: "User-Agent")
    var userResponse:URLResponse? = nil;
   var userError:NSError? = nil;
    do {
        let data = NSURLConnection.sendSynchronousRequest(userRequest, returningResponse: &userResponse, error: &userError)
    } catch let error as NSError {
        print("Error: \(error.localizedDescription)")
    }
}
--------------------------------------------- */



