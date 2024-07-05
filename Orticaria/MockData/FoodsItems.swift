//
//  FoodsItems.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 05/07/24.
//

import Foundation

struct FoodsList: Codable {
    let list: [FoodCategory]
}

struct FoodCategory: Codable {
    let title: String
    let isCancellable: Bool
    let elements: [String]
}
