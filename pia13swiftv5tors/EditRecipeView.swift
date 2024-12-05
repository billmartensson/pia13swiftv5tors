//
//  EditRecipeView.swift
//  pia13swiftv5tors
//
//  Created by BillU on 2024-12-05.
//

import SwiftUI

struct EditRecipeView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var currentRecipe = Recipe()
    
    @State var isAdd = false
    
    var body: some View {
        VStack {
            if isAdd {
                Text("Add")
            } else {
                Text("Edit")
            }

            Text("Category")
            HStack {
                Button(action: {
                    currentRecipe.category = "dessert"
                }) {
                    Text("Dessert")
                        .padding()
                        .background(currentRecipe.category == "dessert" ? Color.yellow : Color.white)
                }

                Button(action: {
                    currentRecipe.category = "soup"
                }) {
                    Text("Soup")
                        .padding()
                        .background(currentRecipe.category == "soup" ? Color.yellow : Color.white)
                }

                
            }
            
            
            Text("Title")
            TextField("", text: $currentRecipe.title)
                .background(Color.gray)

            Text("Instruction")
            TextField("", text: $currentRecipe.instruction)
                .background(Color.gray)
            
            Button(action: {
                saveRecipe()
            }) {
                Text(isAdd ? "Add" : "Save")
            }
            
            if isAdd == false {
                Button(action: {
                    modelContext.delete(currentRecipe)
                    dismiss()
                }) {
                    Text("Delete")
                }
            }
        }
    }
    
    func saveRecipe() {
        if(currentRecipe.category == "") {
            // VISA FEL
            return
        }
        
        
        modelContext.insert(currentRecipe)
        dismiss()
    }
}

#Preview {
    EditRecipeView()
}
