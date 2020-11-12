//
//  RegistrationModel.swift
//  OpitzChat
//
//  Created by Opitz on 15.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI
import Combine


class RegistrationModel: ObservableObject, RegistrationService {
    @Published var userIsLoggedIn = false
    @Published var username = ""
    @Published var password = ""
    @Published var duplicatedPassword = ""
    @ObservedObject var session: SessionStore
    
    init(session: SessionStore) {
        self.session = session
    }
    
    
    func register() {
        print("DATA: ", username + password)
        session.register(email: username, password: password) { (user, error) in
            if let error = error {
                print("ERROR: ", error.localizedDescription)
            } else {
                self.username = ""
                self.password = ""
                self.duplicatedPassword = ""
                self.userIsLoggedIn = true
            }
            
        }
    }
    
    
    
}
