//
//  RegisterService.swift
//  OpitzChat
//
//  Created by Opitz on 15.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation

protocol RegistrationService{
    var username: String { get set }
    var password: String { get set }
    var duplicatedPassword: String { get set }
    
    func register()
}
