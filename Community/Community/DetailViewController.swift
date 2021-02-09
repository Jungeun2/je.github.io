//
//  DetailViewController.swift
//  Community
//
//  Created by 이정은 on 2020/09/18.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var id: Int?
    var ViewItem: BoardView?
    var comment: [ViewComments]?
//    var CommentList: [comment]?
    
//    var DeleteList: deletelist?
    
    @IBOutlet var txtMainTitle: UILabel!
    @IBOutlet var txtWritingTitle: UILabel!
    @IBOutlet var txtUserName: UILabel!
    @IBOutlet var txtDate: UILabel!
    @IBOutlet var txtCount: UILabel!
    @IBOutlet var writingFild: UITextView!
    @IBOutlet var commentview: UIView!
    @IBOutlet var CommnetInput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = self.id {
            NetworkHandler.DetailBoard({ ViewItem in
                self.ViewItem = ViewItem
                self.DetailViewList()
            }, b_id: id)
            
            NetworkHandler.getComment({ comment in
                self.comment = comment
            }, b_id: id)
        }
    
        self.writingFild.layer.borderWidth = 1.0
        self.writingFild.layer.borderColor = UIColor.gray.cgColor
        
        self.CommnetInput.layer.borderWidth = 1.0
        self.CommnetInput.layer.borderColor = UIColor.gray.cgColor
    
    }
    
    func DetailViewList() {
//        DispatchQueue.global(qos: .background).async {
        DispatchQueue.main.async {
   
    if let ViewItem = self.ViewItem {
        if ViewItem.b_type == "1" {
            self.txtMainTitle.text = "자유 게시판"
        } else if ViewItem.b_type == "2" {
            self.txtMainTitle.text = "게임 게시판"
        } else if ViewItem.b_type == "3" {
            self.txtMainTitle.text = "음식 게시판"
        } else if ViewItem.b_type == "4" {
            self.txtMainTitle.text = "코딩 게시판"
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko") // 로케일 변경
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        
        self.txtWritingTitle.text = ViewItem.b_title
        self.txtUserName.text = "작성자: " + String(ViewItem.userId ?? "")
        self.txtCount.text = "조회: " + String(ViewItem.b_count ?? 0)
                
        self.writingFild.isEditable = false
        self.writingFild.text = ViewItem.b_content
        self.TimeStamp()
        }
    }
}
    
    func TimeStamp() {
        let unixTimestamp = ViewItem?.b_date ?? 0
        let date = Date(timeIntervalSince1970: unixTimestamp / 1000)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let strDate = dateFormatter.string(from: date)
        txtDate.text = strDate
    }
    
    
    // autolayout
    func adjustUITextViewHeight() {
        writingFild = UITextView(frame: .zero, textContainer: nil)
        
        writingFild.sizeToFit()
        writingFild.isScrollEnabled = false
        view.addSubview(writingFild)
        
        writingFild.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([writingFild.topAnchor.constraint(equalTo: safeArea.topAnchor), writingFild.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor), writingFild.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    // 수정 버튼
    @IBAction func btnUpdate(_ sender: UIButton) {
        touchupdate()
    }
    
    // 삭제 버튼
    @IBAction func btnDelete(_ sender: UIButton) {
        touchdelete()
    }
    
    func touchupdate() {
        let alert = UIAlertController(title: "", message: String(id ?? 0) , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    func touchdelete() {
        let alert = UIAlertController(title: "", message: "삭제하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { ACTION in
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueComment" {
            let commentController = segue.destination as! CommentController
            commentController.id = id

        }
    }
    
    @IBAction func btnCommnet(_ sender: UIButton) {
        
    }
    
}
