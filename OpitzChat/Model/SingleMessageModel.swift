//
//  SingleMessageModel.swift
//  OpitzChat
//
//  Created by Opitz on 27.08.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation

struct SingleMessageModel: Codable {
    var message: String
    var myMessage: Bool
}

extension SingleMessageModel: Hashable {}
