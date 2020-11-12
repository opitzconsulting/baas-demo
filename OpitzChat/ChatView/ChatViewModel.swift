//
//  ChatViewModel.swift
//  OpitzChat
//
//  Created by Opitz on 27.08.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore

class ChatViewModel : ObservableObject{
    @Published var show : Bool = false
    @Published var msgs = [MessageModel]()
    @Published var selectedMessageIndex = 0
    
    init() {
        loadMessages()
    }
    
    func loadMessages() {
        let db = Firestore.firestore()
        db.collection("chats").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("NO Chats")
                return
            }
            self.msgs = documents.compactMap { (queryDocumentSnapshot) -> MessageModel? in
                return try? queryDocumentSnapshot.data(as: MessageModel.self)
            }
            print(dump(self.msgs))
        }
    }
}
