//
//  RecipeListView.swift
//  pia13swiftv5tors
//
//  Created by BillU on 2024-12-05.
//

import SwiftUI
import SwiftData

struct RecipeListView: View {
    
    
    @Query var recipies: [Recipe]
    
    
    init(cat : String) {
        self._recipies = Query(filter: #Predicate<Recipe> { rec in
            if cat == "" {
                return true
            } else {
                if rec.category == cat {
                    return true
                } else {
                    return false
                }
            }
        }, sort: \.title)
    }
    
    var body: some View {
        List(recipies) { rec in
            NavigationLink(destination: RecipeDetailView(currentRecipe: rec)) {
                Text(rec.title)

            }
        }
    }
}

#Preview {
    RecipeListView(cat: "")
}
