//
//  FoodsViewModel.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 02/07/24.
//

import Foundation

struct ListFoodsUIItem: Identifiable {
    var id = UUID()
    var title: String
    var isCancellable = false
    var elements: [LabelAndIconUIItem] = []
}
 
class FoodsViewModel: ObservableObject {
    
    @Published var list: [ListFoodsUIItem] = []
    @Published var categoriesFood: [FoodCategory] = []
    private var foodsAPI = FoodsAPI()
    
    var searchItem = SearchBarUIItem()
    
    private func loadSearch() {
        searchItem = SearchBarUIItem(
            placeholder: "Cerca",
            iconRightButton: "",
            textRightButton: "Add",
            action: { [weak self] in
                   self?.add(name: "prova")
            })
    }
    
    init() {
        loadSearch()
        fetchList()
        
        list.removeAll{ $0.elements.isEmpty }
    }
    
    func fetchList() {
        foodsAPI.fetchGroceryList()
        self.list = mapListFood(items: foodsAPI.categoriesFood)
        
    }
    
    
    private func mapListFood(items: [FoodCategory]) -> [ListFoodsUIItem] {
        return items.map { food in
            ListFoodsUIItem(title: food.title, isCancellable: food.isCancellable, elements: mapFood(names: food.elements))
        }
    }
    
    private func mapFood(names: [String]) ->  [LabelAndIconUIItem] {
        return names.map { string in
            LabelAndIconUIItem(title: string, iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill")
        }
    }
    
    private func add(name: String) {
        //Scrivere sul json
    }
    
}
