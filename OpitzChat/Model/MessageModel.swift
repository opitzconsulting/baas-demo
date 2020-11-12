//
//  MessageModel.swift
//  OpitzChat
//
//  Created by Opitz on 19.08.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct MessageModel : Identifiable, Codable {
    @DocumentID var id : String? = UUID().uuidString
    var time : Date
    var name : String
    var pic : String
    var messages: [SingleMessageModel]
    
    func uploadMessage(singleMessage: SingleMessageModel) {
        let db = Firestore.firestore()
        
        db.collection("chats").document(id ?? "").getDocument { document, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                let updatedMessages = self.messages + [singleMessage]
                let data: [[String: Any]] = updatedMessages.compactMap { return ["message": $0.message, "myMessage": $0.myMessage] }
                do {
                    try? document?.reference.updateData(["messages": data])
                } catch {
                    print("UPLOAD ERROR: ", error.localizedDescription)
                }
            }
        }
    }
}

extension MessageModel: Hashable {}
