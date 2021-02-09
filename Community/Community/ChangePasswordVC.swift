//
//  ChangePasswordVC.swift
//  Community
//
//  Created by 이정은 on 2020/10/14.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {
    @IBOutlet var currentPwTF: UITextField!
    @IBOutlet var newPwTF: UITextField!
    @IBOutlet var newPwCheckTF: UITextField!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        currentPwTF.clearButtonMode = .whileEditing
        newPwTF.clearButtonMode = .whileEditing
        newPwCheckTF.clearButtonMode = .whileEditing
        
        self.okButton.layer.borderWidth = 1.0
        self.okButton.layer.borderColor = UIColor.gray.cgColor
        self.cancelButton.layer.borderWidth = 1.0
        self.cancelButton.layer.borderColor = UIColor.gray.cgColor
        
        newPwTF.text = ""
    }

    @IBAction func btnSave(_ sender: Any) {
    
    }
    
    @IBAction func btnReset(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
