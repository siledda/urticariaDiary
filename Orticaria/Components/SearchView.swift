//
//  SearchView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 04/07/24.
//

import SwiftUI

struct SearchBarUIItem {
    var placeholder: String = "Cerca"
    var iconRightButton: String?
    var textRightButton: String?
    var action: (() -> Void)?
    
}

import SwiftUI


struct SearchView: View {
    
    var item: SearchBarUIItem?
    
    @Binding var searchText: String
    @State private var isSearching: Bool = false

    var body: some View {
        
        HStack {
            TextField(item?.placeholder ?? "", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isSearching {
                            Button(action: {
                                self.searchText = ""
                                self.isSearching = false
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                            
                        }
                           
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isSearching = true
                }
            
            if isSearching {
                Button(action: {
                    item?.action?()
                    self.searchText = ""
                    self.isSearching = false
                }) {
                    Text(item?.textRightButton ?? "")
                    Image(systemName: item?.textRightButton ?? "")
                }
                
                .padding(.trailing, 10)
                .transition(.slide)
            }
            
        }
        .animation(.bouncy, value: isSearching)
        .padding(.top, 10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var searchText: String = ""
        SearchView(searchText: $searchText)
    }
}
