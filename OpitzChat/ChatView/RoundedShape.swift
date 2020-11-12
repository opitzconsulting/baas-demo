//
//  RoundedShape.swift
//  OpitzChat
//
//  Created by Opitz on 30.09.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI

struct Rounded : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: 55, height: 55))
        return Path(path.cgPath)
    }
}

struct Rounded_Previews: PreviewProvider {
    static var previews: some View {
        Rounded()
    }
}
