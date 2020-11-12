//
//  User.swift
//  OpitzChat
//
//  Created by Opitz on 15.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation

struct User {
    var uid: String
    var email: String?
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
}
