//
//  MessageTail.swift
//  OpitzChat
//
//  Created by Opitz on 30.09.20.
//  Copyright © 2020 Opitz. All rights reserved.
//

import SwiftUI

struct MessageTail : Shape {
    @State var myMessage : Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,myMessage ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
}

struct MessageTail_Previews: PreviewProvider {
    static var previews: some View {
        MessageTail(myMessage: false)
    }
}
