//
//  Item.swift
//  Digital wallet
//
//  Created by omotayo ayomide on 14/04/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
