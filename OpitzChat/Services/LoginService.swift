//
//  LoginService.swift
//  OpitzChat
//
//  Created by Opitz on 15.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation

protocol LoginService {
    var username: String { get set }
    var password: String { get set }
    
    func login()
    
}
