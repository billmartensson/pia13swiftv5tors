//
//  Recipe.swift
//  pia13swiftv5tors
//
//  Created by BillU on 2024-12-05.
//

import Foundation
import SwiftData

@Model
class Recipe {
    var title : String = ""
    var instruction = ""
    var category = ""

    var ingredients : [Ingredient] = []
    
    init() {
        
    }
}

@Model
class Ingredient {
    var name = ""
    var amount = ""
    
    init() {
        
    }
}
