//
//  User.swift
//  ApiParser
//
//  Created by Binshad on 12/11/18.
//  Copyright © 2018 Binshad. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let username: String?
    let email: String?
    let isStaff: Bool
    let token: String?
}
