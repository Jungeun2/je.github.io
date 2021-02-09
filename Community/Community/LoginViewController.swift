//
//  LoginViewController.swift
//  Community
//
//  Created by 이정은 on 2020/09/18.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var param: String?
    var loginList: Login?
    var loginId: String?
    
    @IBOutlet var inputId: UITextField!
    @IBOutlet var inputPass: UITextField!
    @IBOutlet var alertId: UILabel!
    @IBOutlet var alertPass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        NetworkHandler.loginBoard({ LoginList in
//        self.LoginList = LoginList
//        }, param: param ?? "")
        
        alertId.text = "아이디가 입력되지 않았습니다"
        alertId.textColor = UIColor.red
        alertPass.text = "비밀번호가 입력되지 않았습니다"
        alertPass.textColor = UIColor.red
        
        alertId.isHidden = true
        alertPass.isHidden = true
    
}
    override func viewWillAppear(_ animated: Bool) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let idValue = ad?.paramId {
        inputId.text = idValue
    }
//        if let pwValue = ad?.paramPw {
//        inputPass.text = pwValue
//    }
}
    
    func naviItem() {
        self.navigationItem.leftBarButtonItem?.isEnabled = true;
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    func hasUser(id: String, pw: String) -> Bool {
        if loginList?.userId == id && loginList?.userPw == pw {
        }
        return true
    }

    @IBAction func btnLogin(_ sender: UIButton) {
    
        if inputId.text == "" {
            alertId.isHidden = false
        } else if inputId.text != "" {
            alertId.isHidden = true
        }
        
        if inputPass.text == "" {
            alertPass.isHidden = false
        } else if inputPass.text != "" {
            alertPass.isHidden = true
        }
    
        api()
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        ad?.paramId = inputId.text
        print("이것은 appdelegate의 paramId 입니다 : ",ad?.paramId ?? "")
        self.presentingViewController?.dismiss(animated: true)

        let ud = UserDefaults.standard
        ud.set(self.inputId.text, forKey: "id")
        self.presentingViewController?.dismiss(animated: true)
        
        if let loginId = ud.string(forKey: "id") {
        inputId.text = loginId
            
        let viewController = storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
                
        viewController.loginId = loginId
        self.navigationController?.popViewController(animated: true)
        print("viewcontorller 로 넘어간 loginId: ",loginId)
            

        }
}
        
        func api() {
        let userId = self.inputId.text
        let userPw = self.inputPass.text
        let jsonData = "{\"userId\":\"\(userId ?? "")\",\"userPw\":\(userPw ?? "")}"
            
        let url = URL(string: "http://localhost:8080/member/login")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonData.data(using: .utf8)
            
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(String(jsonData.count), forHTTPHeaderField: "Content-Length")
            
            
        // URLSession 객체를 통해 전송, 응답값 처리
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//                print(httpResponse.statusCode)
                
        // 서버가 응답이 없거나 통신이 실패
            if let e = error {
                NSLog("An error has occured: \(e.localizedDescription)")
                    return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print( httpResponse.allHeaderFields )
                                
                // TODO : 여기서 response의 결과로 오는 사용자의 데이터를 앱델리게이트에 저장하고 홈으로 이동시킨다.
                // 홈화면이나 다른 화면에서는 항상 앱델리게이트를 참조해서, 사용자 정보가 있으면 로그인한 경우, 없으면 미로그인 상태
                
                guard let data = data else {return}
                
                let decoder = JSONDecoder()
                
                struct UserData: Codable {
                    let userId: String?
                    let profile: String?
                }
                    
                do {
                    let userData = try decoder.decode(UserData.self, from: data)
                    
                    DispatchQueue.main.async {
                    let ad = UIApplication.shared.delegate as? AppDelegate
                    ad?.paramProfile = userData.profile
                        
                    let d = Data(base64Encoded: ad?.paramProfile ?? "")
                    let test = String(data: d!, encoding: .utf8)
                        
                    print("test",test)
                        
//                    print("appdelegate - paramProfile : ",ad?.paramProfile ?? "")
                        }
//                    print(userData.profile ?? 0)
                } catch {
                    print("Error:\(error)")
                }
            
                // userid를 appdelegate에 저장해놓기.
//                print( String (data: data, encoding: .utf8) ?? "" )
                
            }
                print("URL : ",url ?? "")
                print(jsonData)
//                LoginLogin()
            }
                // POST 전송
                task.resume()
        }
    
    @IBAction func btnSignup(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signupViewController = storyBoard.instantiateViewController(withIdentifier: "signUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signupViewController, animated: true)
        }
}
