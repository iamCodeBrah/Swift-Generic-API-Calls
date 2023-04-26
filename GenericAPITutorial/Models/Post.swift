//
//  Post.swift
//  GenericAPITutorial
//
//  Created by YouTube on 2023-04-25.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
