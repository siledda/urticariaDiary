//
//  ContentViewModel.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 01/07/24.
//

import Foundation
import SwiftUI

enum TypeView {
    case cibo
    case storico
    case messaggio
    case cuore
    case none
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .cibo:
            FoodsView()
        case .storico:
            Text("Storico View")
        case .messaggio:
            Text("Messaggio View")
        case .cuore:
            Text("Cuore View")
        case .none:
            Text("nulla")
        }
    }
}


class ContentViewModel: ObservableObject {
    
    var infoItems: [InfoUIItem] = []
    @Published var selectedView: TypeView = .none
    @Published var shouldNavigate: Bool = true
    
    init() {
        loadData()
    }
    
    private func loadData() {
        infoItems = [
            InfoUIItem(imageName: "leaf", title: "CIBO", type: TypeView.cibo),
            InfoUIItem(imageName: "calendar", title: "storico", type: .storico),
            InfoUIItem(imageName: "message", title: "messaggio", type: .messaggio),
            InfoUIItem(imageName: "heart", title: "cuore", type: .cuore),
        ]
    }
    
     func navigate(to destination: TypeView) {
        selectedView = destination
    }
}
