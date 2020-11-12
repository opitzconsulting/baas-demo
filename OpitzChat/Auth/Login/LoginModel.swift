//
//  SignInModel.swift
//  OpitzChat
//
//  Created by Opitz on 15.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI
import Combine
import Firebase

class LoginModel: ObservableObject, LoginService {
    @Published var loginSuccessFul = false
    @Published var username = ""
    @Published var password = ""
    @ObservedObject var session: SessionStore
    
    init(session: SessionStore) {
        self.session = session
    }
    
    func login() {
        session.login(email: username, password: password) { (user, error) in
            if let error = error {
                print("ERROR: ", error.localizedDescription)
            } else {
                self.username = ""
                self.password = ""
                self.loginSuccessFul = true
            }
        }
    }
}
