//
//  InfoView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 30/06/24.
//

import SwiftUI

struct InfoUIItem {
    var imageName = ""
    var title = ""
    var type: TypeView = .none
}

struct InfoView: View {
    
    var item: InfoUIItem
    
    var hasShadow = false
 
    
    var body: some View {
        VStack {
            Image(systemName: item.imageName)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(.top, 8)
               
            
            Text(item.title)
                .padding(.vertical, 8)
        }
        
        

    }
}

#Preview {
    
    InfoView(item: InfoUIItem(imageName:"globe", title: "prova"))
}
