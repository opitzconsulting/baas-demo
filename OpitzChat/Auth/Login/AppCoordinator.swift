//
//  ContentView.swift
//  OpitzChat
//
//  Created by Opitz on 10.07.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI

struct AppCoordinator: View {
    @ObservedObject var session: SessionStore
    @State var userIsLoggedIn = false
    
    var body: some View {
        if session.session == nil && !userIsLoggedIn{
            return AnyView(WelcomeView(session: session, userIsLoggedIn: $userIsLoggedIn))
        } else {
            return AnyView(ChatWrapper())
            
        }
    }
}

struct AppCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinator(session: SessionStore())
    }
}
