//
//  DayPickerView.swift
//  WakeUpCall
//
//  Created by Pasindu Vihangana on 2024-10-16.
//

import SwiftUI

struct DayPickerView: View {
    @State private var selectedDays: [Day] = []
    
    var body: some View {
        Text("Select Days")
            .font(.headline)
            .padding(.top)

        List {
            ForEach(Day.allCases, id: \.self) { day in
                HStack {
                    Toggle(day.fullName, isOn: .init(get: {
                        selectedDays.contains(day)
                    }, set: { isSelected in
                        if isSelected {
                            selectedDays.append(day)
                        } else {
                            selectedDays.removeAll { $0 == day }
                        }
                    }))
                }
            }
        }
        .padding()
    }
}

#Preview {
    DayPickerView()
}
