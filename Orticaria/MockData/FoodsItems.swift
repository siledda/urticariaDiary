//
//  FoodsItems.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 05/07/24.
//

import Foundation

struct FoodsList: Codable {
    var list: [FoodCategory]
}

struct FoodCategory: Codable {
    let title: String
    let isCancellable: Bool
    var elements: [String]
}
