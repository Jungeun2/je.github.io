//
//  SignUpViewController.swift
//  Community
//
//  Created by 이정은 on 2020/09/18.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIAlertViewDelegate {
    
    var signList: signUp?
    
    @IBOutlet var txtFieldId: UITextField!
    @IBOutlet var txtFieldPass: UITextField!
    @IBOutlet var txtFieldCheck: UITextField!
    @IBOutlet var noId: UILabel!
    @IBOutlet var noPass: UILabel!
    @IBOutlet var checkPass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noId.text = "아이디가 입력되지 않았습니다"
        noId.textColor = UIColor.red
        noPass.text = "비밀번호가 입력되지 않았습니다"
        noPass.textColor = UIColor.red
        checkPass.text = "비밀번호가 일치하지 않습니다"
        checkPass.textColor = UIColor.red

        noId.isHidden = true
        noPass.isHidden = true
        checkPass.isHidden = true
        
//        NetworkHandler.SignUpBoard() { signList in
//            self.signList = signList
//        }
    }

    func signUptxt() {
        if let signList = self.signList {
            self.txtFieldId.text = signList.userId
            self.txtFieldPass.text = signList.userPw
            if txtFieldPass.text == txtFieldCheck.text {
                self.txtFieldCheck.text = signList.userPw
            }
        }
    }
    
    @IBAction func btnSignup(_ sender: UIButton) {
        
        if txtFieldId.text == "" {
            noId.isHidden = false
        } else if txtFieldId.text != "" {
            noId.isHidden = true
        }
        
        if txtFieldPass.text == "" {
            noPass.isHidden = false
        } else if txtFieldPass.text != "" {
            noPass.isHidden = true
        }
        
//        let userId = txtFieldId.text;
//        let userPw = txtFieldPass.text;
//        
//        UserDefaults.standard.set(userId, forKey: "userId")
//        UserDefaults.standard.set(userPw, forKey: "userPw")
//        
        api()
    }
        
    
    func displayAlertMessage(userMessage:String) {
        let alert = UIAlertController(title:"경고", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated : false, completion : nil)
    }
    
    func api() {
        let userId = self.txtFieldId.text
        let userPw = self.txtFieldPass.text
//        let CheckuserPw = self.txtFieldCheck.text
        
        let jsonData = "{\"userId\":\"\(userId ?? "")\",\"userPw\":\(userPw ?? "")}"
            
        let url = URL(string: "http://localhost:8080/member/signUp")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonData.data(using: .utf8)
            
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(String(jsonData.count), forHTTPHeaderField: "Content-Length")
            
            
        // URLSession 객체를 통해 전송, 응답값 처리
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
        // 서버가 응답이 없거나 통신이 실패
            if let e = error {
                NSLog("An error has occured: \(e.localizedDescription)")
                    return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print( httpResponse.allHeaderFields )
            }
                    
                // 응답 처리 로직
                print("URL : ",url ?? "")
                print(jsonData)
            }
                // POST 전송
                task.resume()
        }
    
}
