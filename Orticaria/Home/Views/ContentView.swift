//
//  ContentView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 29/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var number = 70
    
    @StateObject private var viewModel = ContentViewModel()
    
    let gridItems = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible() )
    ]

    
    var body: some View {
        
        NavigationView(content: {
            
            ScrollView {
                
                VStack {
                    RoundedView(number: $number)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 60)
                        .padding(.bottom, 40)
                        .background()
                    
                    
                    Divider()
                        .padding(.bottom, 16)
                    
                    
                    LazyVGrid(columns: gridItems, alignment: .center, spacing: 16) {
                        
                        ForEach(viewModel.infoItems, id: \.title) { item in
                            
                            NavigationLink(destination: {
                                item.type.view()
                            }) {
                                InfoView(item: item)
                                    
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                    )
                            }
                            
                            
                           
                        }
                        
                    }
                    
                    
                    .padding(.horizontal)
                   
                   
                    
                    .navigationTitle("Home Diario")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        })
        
        .scrollDisabled(false)
        .padding(.vertical)
    }
}

#Preview {
    ContentView()
}
