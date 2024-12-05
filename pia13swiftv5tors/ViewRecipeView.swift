//
//  ViewRecipeView.swift
//  pia13swiftv5tors
//
//  Created by BillU on 2024-12-05.
//

import SwiftUI

struct ViewRecipeView: View {
    
    @State var currentRecipe = Recipe()
    
    var body: some View {
        
        VStack {
            Text(currentRecipe.title)
            Text(currentRecipe.category)
            Text(currentRecipe.instruction)
        }
        
    }
}

#Preview {
    ViewRecipeView()
}
