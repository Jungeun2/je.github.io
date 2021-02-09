//
//  ViewController.swift
//  Community
//
//  Created by 이정은 on 2020/09/15.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var BoardValue: [BoardList]?
    var rankValue: [BoardRank]?
    
    var id: Int?
    var loginId: String?
    var idValue: String?
    var pwValue: String?
    var leftBarButtonItem : UIBarButtonItem!
    var rightBarButtonItem : UIBarButtonItem!
    
    
    @IBOutlet var searchTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    NetworkHandler.getBoardList() { BoardValue in
        self.BoardValue = BoardValue
    }
//        print(self.BoardValue ?? "")
    NetworkHandler.getRankList() { rankValue in
        self.rankValue = rankValue
        print("inside the segue:\(String(describing: rankValue))")
//        print("getLankList:\(self.rankValue ?? [])")
    }

        
        self.navigationItem.title = "Community"
        self.navigationItem.leftBarButtonItem?.isEnabled = true;
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.clear
        //        self.navigationItem.rightBarButtonItem?.isEnabled = true;
        //        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
        //        navigationController?.setNavigationBarHidden(false, animated: true)
}
    
    @IBAction func btnFreeBoard(_ sender: UIButton) {
        let filteredBoard = BoardValue?.filter{$0.b_type == "1"}
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tableViewController = storyBoard.instantiateViewController(withIdentifier: "tableViewController") as! TableViewController
            tableViewController.boards = filteredBoard
            tableViewController.titleString = sender.titleLabel?.text
        self.navigationController?.pushViewController(tableViewController, animated: true)
//        print(BoardValue ?? "")
        
    }
    
    @IBAction func btnGameBoard(_ sender: UIButton) {
        let filteredBoard = BoardValue?.filter{$0.b_type == "2"}
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tableViewController = storyBoard.instantiateViewController(withIdentifier: "tableViewController") as! TableViewController
                tableViewController.boards = filteredBoard
                tableViewController.titleString = sender.titleLabel?.text
            self.navigationController?.pushViewController(tableViewController, animated: true)
//        print(BoardValue ?? "")
    }
    
    @IBAction func btnPickBoard(_ sender: UIButton) {
        let filteredBoard = BoardValue?.filter{$0.b_type == "3"}
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tableViewController = storyBoard.instantiateViewController(withIdentifier: "tableViewController") as! TableViewController
                tableViewController.boards = filteredBoard
                tableViewController.titleString = sender.titleLabel?.text
            self.navigationController?.pushViewController(tableViewController, animated: true)
//        print(BoardValue ?? "")
    }
    
    
    @IBAction func btnVideoBoard(_ sender: UIButton) {
        let filteredBoard = BoardValue?.filter{$0.b_type == "4"}
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tableViewController = storyBoard.instantiateViewController(withIdentifier: "tableViewController") as! TableViewController
                tableViewController.boards = filteredBoard
                tableViewController.titleString = sender.titleLabel?.text
            self.navigationController?.pushViewController(tableViewController, animated: true)
    }
    
    @IBAction func btnSearchTapped(_ sender: Any) {
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        if segue.identifier == "FreeSegue" {
            let filteredBoard = BoardValue?.filter{$0.b_type == "1"}
            let mainPageTableVC = segue.destination as? MainPageTableVC
            mainPageTableVC?.boards = filteredBoard
            
        }
                        
        if segue.identifier == "GameSegue" {
            let filteredBoard = BoardValue?.filter{$0.b_type == "2"}
            let mainPageTableVC = segue.destination as? MainPageTableVC
            mainPageTableVC?.boards = filteredBoard
        }
        
        if segue.identifier == "FoodSegue" {
            let filteredBoard = BoardValue?.filter{$0.b_type == "3"}
            let mainPageTableVC = segue.destination as? MainPageTableVC
            mainPageTableVC?.boards = filteredBoard
        }
        
        if segue.identifier == "CodingSegue" {
            let filteredBoard = BoardValue?.filter{$0.b_type == "4"}
            let mainPageTableVC = segue.destination as? MainPageTableVC
            mainPageTableVC?.boards = filteredBoard
        }
        
        if segue.identifier == "rankSegue" {
            let rankTableVC = segue.destination as! RankTableVC
            rankTableVC.rank = rankValue
            rankTableVC
    }
}
//    func sucessLogin() {
//        print(loginId)
//            
//    }
    
}

