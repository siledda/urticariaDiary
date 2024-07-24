//
//  DatePickerCalendarTapView.swift
//  Orticaria
//
//  Created by Ledda, Silvia on 20/07/24.
//

import SwiftUI

struct DatePickerCalendarTapView: View {
    @Binding var date: Date
    var now = Date()

    var body: some View {
            DatePicker(
                "",
                selection: $date ,
                in: ...now,
                displayedComponents: [.date]
            )
        
            .cornerRadius(10)
            .datePickerStyle(.compact)
            .frame(maxWidth: .leastNonzeroMagnitude)
        
        
    }
}

#Preview {
    @State var today = Date()
    return DatePickerCalendarTapView(date: $today)
}
