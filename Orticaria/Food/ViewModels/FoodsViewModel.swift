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
    var elements: [LabelAndIconUIItem] = []
}

class FoodsViewModel: ObservableObject {
    
  //  LabelAndIconUIItemù
    
    
    var dataVerdura: [LabelAndIconUIItem] = [
        LabelAndIconUIItem(title: "Pomodori", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Melanzane", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Spinaci", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Avocado", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Zucchine", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Patate", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Peperoni", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Asparagi", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Barbabietole", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Fagioli", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill")
    ]

    var dataFrutta: [LabelAndIconUIItem] = [
        LabelAndIconUIItem(title: "Banane", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Ananas", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Mele", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Uva", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Ciliegie", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Mango", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Fragole", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Pere", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Kiwi", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Pesche", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill")
    ]

    var dataPesce: [LabelAndIconUIItem] = [
        LabelAndIconUIItem(title: "Tonno", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Sgombro", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Alici", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Sardine", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Acciughe", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Aringhe", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Baccalà", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Merluzzo", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Caviale", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill"),
        LabelAndIconUIItem(title: "Polpo", iconName: "square", iconNameSelected: "checkmark.rectangle.portrait.fill")
    ]
    
    var myFood: [LabelAndIconUIItem] = []
    
    @Published var list: [ListFoodsUIItem] = []
    
    
    init() {
        load()
    }
    
    func load() {
        
         list = [
            ListFoodsUIItem(title: "Verdura", elements: dataVerdura),
            ListFoodsUIItem(title: "Frutta", elements: dataFrutta),
            ListFoodsUIItem(title: "Pesce", elements: dataPesce),
            ListFoodsUIItem(title: "Aggiunti da me", elements: myFood)
        ]
    }
    
}
