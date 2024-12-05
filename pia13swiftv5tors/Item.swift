//
//  Item.swift
//  pia13swiftv5tors
//
//  Created by BillU on 2024-12-05.
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
