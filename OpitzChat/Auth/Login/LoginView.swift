//
//  LoginView.swift
//  OpitzChat
//
//  Created by Opitz on 17.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var model: LoginModel
    @Binding var userIsLoggedIn: Bool
    var body: some View {
        VStack {
            Image("loginImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "person")
                        .frame(width: 30, height: 30, alignment: .center)
                    TextField("Email", text: $model.username)
                }.padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width*0.8)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 9, y: 9)
                
                HStack {
                    Image(systemName: "lock")
                        .frame(width: 30, height: 30, alignment: .center)
                    SecureField("Password", text: $model.password)
                }.padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width*0.8)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 9, y: 9)
                    .onReceive(model.$loginSuccessFul) { value in
                        self.userIsLoggedIn = value
                }
                
                
                Button(action: {
                    self.model.login()
                    self.userIsLoggedIn = self.model.loginSuccessFul
                }) {
                    Text("Login")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(16)
                        .shadow(color: Color.blue.opacity(0.3), radius: 20, x: 9, y: 9)
                }
            }.navigationBarTitle(Text("Login"), displayMode: .large)
        }.frame(width: UIScreen.main.bounds.width * 0.9)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 9, y: 9)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: LoginModel(session: SessionStore()), userIsLoggedIn: .constant(false))
    }
}
