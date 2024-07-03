//
//  FoodsView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 01/07/24.
//


import SwiftUI

struct FoodsView: View {
    
    @ObservedObject var viewModel = FoodsViewModel()
    @State var selected: [String] = UserDefaults.standard.stringArray(forKey: "ciboSalvato") ?? []
    @State var searchText: String = ""
    @State var isPresented = true
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(viewModel.list) { foods in
                    Section(header: Text(foods.title)) {
                        ForEach(foods.elements) { element in
                            LabelAndIconView(item: element, isSelected: selected.contains(element.title))
                                .onTapGesture {
                                    selectedElement(element: element.title)
                                }
                        }
                    }
                }
            }
            
            .navigationBarTitle("Lista Espandibile")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt:  "Search food items")

            .listStyle(.grouped)
            
            .onChange(of: searchText, { oldValue, newValue in
                
                viewModel.load()
                
                if newValue.isEmpty {
                    return
                }
                
                viewModel.list.indices.forEach { index in
                 
                    var updatedElements = viewModel.list[index].elements
                    
                    updatedElements = updatedElements.filter { element in
                        element.title.localizedCaseInsensitiveContains(newValue)
                    }
                    
          
                    viewModel.list[index].elements = updatedElements
                }

                
                viewModel.list.removeAll { $0.elements.isEmpty }
            })
            
            
            
            
            Button(action: saveData) {
                Text("Salva")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
          
            
            
            .navigationTitle("Alimenti")
            
        }
    }
    
    private func saveData() {
        UserDefaults.standard.set(selected, forKey: "SelectedItems")
    }
    
    
    private func selectedElement(element: String) {
        if selected.contains(element) {
            selected.removeAll { $0 == element }
        } else  {
            selected.append(element)
        }
    }
    
        
}

#Preview {
    FoodsView()
}
