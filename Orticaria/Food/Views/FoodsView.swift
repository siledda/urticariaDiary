//
//  FoodsView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 01/07/24.
//


import SwiftUI

struct FoodsView: View {
    
    @StateObject var viewModel = FoodsViewModel()
    @State var selected: [String] = UserDefaults.standard.stringArray(forKey: "ciboSalvato") ?? []
    @State var searchText: String = ""
    @State var isPresented = true
    
    
    
    
    var body: some View {
        
        VStack {
            Spacer()
            
            DatePickerCalendarTapView(date: $viewModel.selectedDate)
            
            
            SearchView(item: viewModel.searchItem, searchText: $searchText)
                .padding(.bottom, 8)
                .onChange(of: searchText, { oldValue, newValue in
                    
                    viewModel.textResearch = searchText
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
            
            List {
                ForEach(viewModel.list) { list in
                    Section(header: Text(list.title)) {
                        ForEach(list.elements) { subItem in
                            LabelAndIconView(item: subItem, isSelected: selected.contains(subItem.title))
                                .onTapGesture {
                                    selectedElement(element: subItem.title)
                                }
                        }
                    }
                }

                .onDelete { offsets in
                    delete(at: offsets)
                  }
                
            }
            
            .navigationBarTitle("Lista")
            .listStyle(.grouped)
            
            Button(action: saveData) {
                Text("Salva")
                    .font(.system(size: 18, weight: .bold)) 
                    .frame(maxWidth: .infinity)
                    .padding(.all)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)

                    
            }
           
            .padding()
            
            
            .navigationTitle("Alimenti")
        }
    }
    
    func delete(at offsets: IndexSet) {
       debugPrint("aaa")
        // TODO: DA GESTIRE MA PRIMA VA GESTITO IL COLLEGAMENTO NEL BACKEND
    }
    
    private func saveData() {
        viewModel.savedInfo(info: SavedFoodsToday(date: viewModel.todayDate, selected: selected))
        
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
