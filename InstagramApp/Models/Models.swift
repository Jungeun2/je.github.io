//
//  Models.swift
//  InstagramApp
//
//  Created by 이정은 on 2020/12/02.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import Foundation

enum Gender {
    case male, female, other
}

struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let post: Int
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailimage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLikes]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
}

struct PostLikes {
    let username: String
    let postIdentifier: String
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
    
}
