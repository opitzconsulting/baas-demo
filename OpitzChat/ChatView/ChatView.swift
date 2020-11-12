//
//  ChatView.swift
//  OpitzChat
//
//  Created by Opitz on 04.08.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ChatWrapper: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("",displayMode: .inline)
                .navigationBarHidden(true)
        }
    }
}

struct ChatWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ChatWrapper()
    }
}

struct Home : View {
    @ObservedObject var model = ChatViewModel()
    
    var body : some View{
        ZStack{
            Color.red.edgesIgnoringSafeArea(.top)
            
            VStack{
                topView()
            }
        }
    }
}

struct topView : View {
    var body : some View{
        VStack{
            HStack(spacing: 15){
                Text("Chats").fontWeight(.heavy).font(.system(size: 23))
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Button(action: {
                }) {
                    Image("menu").resizable().frame(width: 20, height: 20)
                }
                
            }.foregroundColor(Color.white)
                .padding()
            GeometryReader{_ in
                MainView()
                    .clipShape(Rounded())
            }
        }
    }
}

// chat view starts from here.....
struct ChatView : View {
    var message: MessageModel
    
    var body : some View{
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.top)
            VStack(spacing: 0){
                chatTopview(message: message)
                GeometryReader{_ in
                    chatList(chat: self.message)
                }
                chatBottomView(message: message )
            }.navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
        }
    }
}

struct chatTopview : View {
    var message: MessageModel
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        HStack(spacing : 15){
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                
                Image(systemName: "control").font(.title).rotationEffect(.init(degrees: -90))
            }
            
            Spacer()
            
            VStack(spacing: 5){
                Image(message.pic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text(message.name)
                    .fontWeight(.heavy)
                
            }.offset(x: 25)
            
            Spacer()
            
            Button( action: {
                print("Phone Call")
            }) {
                Image(systemName: "phone.fill").resizable().frame(width: 20, height: 20)
                
            }.padding(.trailing, 25)
            
            Button(action: {
                print("Video Call")
            }) {
                
                Image(systemName: "video.fill").resizable().frame(width: 23, height: 16)
            }
            
        }.foregroundColor(.white)
            .padding()
    }
}

struct chatBottomView : View {
    @State var txt = ""
    var message: MessageModel
    
    var body : some View{
        HStack{
            HStack(spacing : 8){
                TextField("Type Something", text: $txt)
                Button(action: {
                    print("select photo")
                }) {
                    
                    Image(systemName: "camera.fill").font(.body)
                    
                }.foregroundColor(.gray)
                
                Button(action: {
                }) {
                    Image(systemName: "paperclip").font(.body)
                }.foregroundColor(.gray)
            }.padding()
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 9, y: 9)
                .keyboardAdaptive()
            
            Button(action: {
                self.message.uploadMessage(singleMessage: SingleMessageModel(message: self.txt, myMessage: true))
                self.txt = ""
            }) {
                
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 23)
                    .padding(13)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .clipShape(Circle())
            }.foregroundColor(.gray)
        }.padding(.horizontal, 15)
            .background(Color.white)
        
        
    }
}

struct chatList : View {
    var chat: MessageModel
    
    var body : some View{
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                ForEach(chat.messages, id: \.self){message in
                    // MARK: ERROROROROROR
                    chatCell(data: message)
                }
            }
            
        }.padding(.horizontal, 15)
            .background(Color.white)
            .clipShape(Rounded())
        
    }
}

struct chatCell : View {
    var data : SingleMessageModel
    
    var body : some View{
        HStack{
            if data.myMessage {
                Spacer()
                Text(data.message)
                    .padding()
                    .background(Color("partnerChatColor"))
                    .clipShape(MessageTail(myMessage: data.myMessage))
                    .foregroundColor(.white)
            } else {
                Text(data.message)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("ownChatColor"))
                    .clipShape(MessageTail(myMessage: data.myMessage))
                
                Spacer()
            }
        }.padding(data.myMessage ? .leading : .trailing, 55)
            .padding(.vertical,10)
    }
}
