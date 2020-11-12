//
//  WelcomeView.swift
//  OpitzChat
//
//  Created by Opitz on 17.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var session: SessionStore
    @Binding var userIsLoggedIn: Bool
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("welcomeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Hello and welcome to the Optiz Chat. Here you can chat with your friends at Opitz!")
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                NavigationLink(destination: RegistrationView(model: RegistrationModel(session: session), userIsLoggedIn: $userIsLoggedIn)) {
                    Text("Register for the chat")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(16)
                        .shadow(color: Color.blue.opacity(0.3), radius: 20, x: 9, y: 9)
                }
                
                NavigationLink(destination: LoginView(model: LoginModel(session: session), userIsLoggedIn: $userIsLoggedIn)) {
                    Text("Login to the chat")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(16)
                        .shadow(color: Color.blue.opacity(0.3), radius: 20, x: 9, y: 9)
                }
            }.navigationBarTitle(Text("Welcome"), displayMode: .large)
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(session: SessionStore(), userIsLoggedIn: .constant(false))
    }
}
