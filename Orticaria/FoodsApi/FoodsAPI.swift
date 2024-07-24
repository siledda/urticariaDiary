//
//  FoodsAPI.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 05/07/24.
//

import Foundation

class FoodsAPI: ObservableObject {
    @Published var list: FoodsList?
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
            self.list = foodsList
        } catch {
            debugPrint(String(describing: error))
        }
    }
    
    func addItemToMyList(listContainer: FoodsList, newItem: String) {
        
        var updateList = listContainer
        
        if let index = listContainer.list.firstIndex(where: { $0.title == "Aggiunti da me" }) {
            updateList.list[index].elements.append(newItem)
        } else {
            // Sezione non trovata, la creiamo
            let newSection = FoodCategory(title: "Aggiunti da me", isCancellable: true, elements: [newItem])
            updateList.list.append(newSection)
        }
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let updatedJsonData = try encoder.encode(updateList)
            
            // Trova il percorso del file JSON
            if let url = Bundle.main.url(forResource: "listFood", withExtension: "json") {
                // Salva i dati aggiornati nel file JSON
                try updatedJsonData.write(to: url)
                
                // Aggiorna le proprietà pubblicate
                self.categoriesFood = updateList.list
                self.list = updateList
            } else {
                print("File JSON non trovato per il salvataggio")
            }
        } catch {
            debugPrint(String(describing: error))
        }
        
    }

    
}
