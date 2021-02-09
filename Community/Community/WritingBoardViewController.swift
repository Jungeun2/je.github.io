//
//  WritingBoardViewController.swift
//  Community
//
//  Created by 이정은 on 2020/10/14.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class WritingBoardViewController: UIViewController {
    @IBOutlet var titleTextfield: UITextField!
    @IBOutlet var contentTextview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextfield.layer.borderWidth = 1.0
        self.titleTextfield.layer.borderColor = UIColor.lightGray.cgColor
        self.contentTextview.layer.borderWidth = 1.0
        self.contentTextview.layer.borderColor = UIColor.lightGray.cgColor
        
        contentTextview.textColor = .lightGray
        contentTextview.text = "내용을 입력해주세요."
    
    }
    
//    func textViewDidBeginEditing (textView: UITextView) {
//        if contentTextview.textColor == ph_TextColor && contentTextview.isFirstResponder() {
//            contentTextview.text = nil
//            contentTextview.textColor = white
//        }
//    }
//    
    
    @IBAction func btnAddPicture(_ sender: Any) {
    }
    
    @IBAction func btnSaveWriting(_ sender: Any) {
    }
}
