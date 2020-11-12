//
//  DateExtension + String.swift
//  OpitzChat
//
//  Created by Opitz on 27.08.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}
