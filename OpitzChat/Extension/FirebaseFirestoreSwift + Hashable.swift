//
//  FirebaseFirestoreSwift + Hashable.swift
//  OpitzChat
//
//  Created by Opitz on 27.08.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

extension DocumentID: Hashable where Value: Hashable {

    static func == (lhs: DocumentID, rhs: DocumentID) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}
