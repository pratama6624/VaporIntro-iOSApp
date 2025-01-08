//
//  Song.swift
//  VaporIntro-iOSApp
//
//  Created by Pratama One on 08/01/25.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
