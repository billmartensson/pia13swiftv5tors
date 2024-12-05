//
//  ContentView.swift
//  pia13swiftv5tors
//
//  Created by BillU on 2024-12-05.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Recipe.title) var recipies: [Recipe]
    
    @State var currentCat = ""

    /*
    @Query(filter: #Predicate<Recipe> { rec in
        rec.category == currentCat
        }) var recipies: [Recipe]
    */
    
    var body: some View {
        
        NavigationStack {
            VStack {
                NavigationLink(destination: EditRecipeView()) {
                    Text("Add")
                }
                
                HStack {

                    Button(action: {
                        currentCat = ""
                    }) {
                        Text("All")
                            .padding()
                            .background(currentCat == "" ? Color.yellow : Color.white)
                    }

                    Button(action: {
                        currentCat = "dessert"
                    }) {
                        Text("Dessert")
                            .padding()
                            .background(currentCat == "dessert" ? Color.yellow : Color.white)
                    }

                    Button(action: {
                        currentCat = "soup"
                    }) {
                        Text("Soup")
                            .padding()
                            .background(currentCat == "soup" ? Color.yellow : Color.white)
                    }

                }
                
                List(recipies) { rec in
                    NavigationLink(destination: ViewRecipeView(currentRecipe: rec)) {
                        Text(rec.title)

                    }
                }
            }
        }
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    /*
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    */
    
}

#Preview {
    ContentView()
        .modelContainer(for: Recipe.self, inMemory: true)
}





/*
 
 NavigationSplitView {
     List {
         ForEach(items) { item in
             NavigationLink {
                 Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
             } label: {
                 Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))
             }
         }
         .onDelete(perform: deleteItems)
     }
     .toolbar {
         ToolbarItem(placement: .navigationBarTrailing) {
             EditButton()
         }
         ToolbarItem {
             Button(action: addItem) {
                 Label("Add Item", systemImage: "plus")
             }
         }
     }
 } detail: {
     Text("Select an item")
 }
 
 
 */
