//
//  RoundedView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 29/06/24.
//

import SwiftUI

struct RoundedView: View {
    
    @Binding var number: Int
    
    var color = Color.gray
    
    @State private var animate = false
       
       var body: some View {
           ZStack {
               Circle()
                   .fill(color)
                   .frame(width: 200, height: 200)
                   .shadow(color: animate ? Color.green.opacity(10) : Color.red.opacity(10), radius: 20, x: 0, y: 0)
                   .animation(.linear(duration: 3)
                    .repeatForever(autoreverses: true), value: animate)
               
               Text(String(number))
                   .font(.largeTitle)
                   .foregroundColor(.white)
           }
           .onAppear {
               animate = true
           }
       }
}

#Preview {
    @State var number = 0
    
    return RoundedView(number: $number)
}
