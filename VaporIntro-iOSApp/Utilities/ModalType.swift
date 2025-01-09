//
//  ModalType.swift
//  VaporIntro-iOSApp
//
//  Created by Pratama One on 09/01/25.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update
}
