//
//  SessionStore.swift
//  OpitzChat
//
//  Created by Opitz on 15.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class SessionStore: ObservableObject {
    @Published var session: User?
    var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        listen()
    }
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user{
                self.session = User(uid: user.uid, email: user.email)
            } else {
                self.session = nil
            }
        })
    }
    
    func login(email: String, password: String, completion: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func register(email: String, password: String, completion: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("ERROR SIGNING OUT")
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
