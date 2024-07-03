//
//  LabelAndIconView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 02/07/24.
//

import SwiftUI

struct LabelAndIconUIItem: Identifiable {
    var id = UUID()
    var title: String = ""
    var iconName: String?
    var iconNameSelected: String?
}

struct LabelAndIconView: View {
    
    var item = LabelAndIconUIItem()
    var isSelected = false
    
    var body: some View {
        
        HStack {
            Text(item.title)
            Spacer()
            Image(systemName: (isSelected ? item.iconNameSelected : item.iconName) ?? "")
            
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    LabelAndIconView(item: LabelAndIconUIItem(title: "Verdura", iconName: "square"))
}
