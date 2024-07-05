//
//  FoodsAPI.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 05/07/24.
//

import Foundation

class FoodsAPI: ObservableObject {
    @Published var categoriesFood: [FoodCategory] = []
    
    
    func fetchGroceryList() {
        guard let url = Bundle.main.url(forResource: "listFood", withExtension: "json") else {
            print("File JSON non trovato")
            return
        }

        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let foodsList = try decoder.decode(FoodsList.self, from: jsonData)
            self.categoriesFood = foodsList.list
        } catch {
            debugPrint(String(describing: error))
        }
    }
}
