//
//  CommunityModel.swift
//  Community
//
//  Created by 이정은 on 2020/09/15.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import Foundation


/*          게시판 리스트보기          */
struct BoardList: Codable {
    var b_id: Int?
    var b_recomment_id: Int?
    var b_type: String?
    var b_title: String?
    var b_date: Double?
    var b_count: Int?
    var userId: String?
    var updateCheck: Int?
    var commentCount: Int?
}

/*          인기 게시물 목록          */
struct BoardRank: Codable {
    var b_id: Int?
    var b_recomment_id: Int?
    var b_type: String?
    var b_title: String?
    var b_date: Int?
    var b_count: Int?
    var userId: String?
    var updateCheck: Int?
    var commentCount: Int?
}



/*          게시판 상세보기          */
struct BoardView: Codable {
    var b_id: Int?
    var b_type: String?
    var b_title: String?
    var b_content: String?
    var b_date: Double?
    var b_count: Int?
    var userId: String?
    var group_id: Int?
    var parent_reply_id: Int?
    var depth: Int?
    var order_no: Int?
    var profile: String?
    var comments: [ViewComments]

}


/*          게시판 댓글          */
struct ViewComments: Codable {
    var c_id: Int?
    var b_id: Int?
    var userId: String?
    var c_content: String?
    var c_date: Int?
    var profile: String?
    var group_id: Int?
    var parent_reply_id: Int?
    var depth: Int?
    var order_no: Int?
    var updateCheck: Int?
}


/*          게시판 로그인          */

struct Login: Codable {
    var userId: String?
    var userPw: String?
    var profile: String?
}



/*          게시판 회원가입          */

struct signUp: Codable {
    var userId: String?
    var userPw: String?
}



/* ---------- 게시판 댓글보기 ---------- */
//struct comment: Codable {
//    var c_id: Int?
//    var b_id: Int?
//    var c_content: String?
//    var userId: String?
//}

