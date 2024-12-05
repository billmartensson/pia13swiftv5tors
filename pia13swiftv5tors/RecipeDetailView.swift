//
//  RecipeDetailView.swift
//  pia13swiftv5tors
//
//  Created by BillU on 2024-12-05.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var currentRecipe = Recipe()
    
    @State var isEdit = false
    
    var body: some View {
        
        VStack {
            if isEdit {
                EditRecipeView(currentRecipe: currentRecipe)
            } else {
                ViewRecipeView(currentRecipe: currentRecipe)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isEdit.toggle()
                }) {
                    Text("Edit")
                }
            }
            
        }
    }
}

#Preview {
    RecipeDetailView()
}
