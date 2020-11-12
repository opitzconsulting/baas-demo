//
//  ChatListView.swift
//  OpitzChat
//
//  Created by Opitz on 27.08.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI

struct MainView : View {
    @ObservedObject var model = ChatViewModel()
    
    var body : some View{
        List(model.msgs) {message in
            NavigationLink(destination: ChatView(message: message)) {
                cellView(chat: message)
            }
        }
    }
}

struct cellView : View {
    var chat: MessageModel
    
    var body : some View {
        HStack(spacing: 15){
            Image(chat.pic).resizable().frame(width: 50, height: 50).clipShape(Circle())
            VStack(alignment:.leading,spacing: 5){
                Text(chat.name)
                Text(chat.messages.first?.message ?? "").lineLimit(2)
            }
            Spacer()
            VStack(spacing: 10){
                Text(chat.time.toString())
                Text(String(chat.messages.count))
                    .padding(8)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }.padding(9)
    }
}
