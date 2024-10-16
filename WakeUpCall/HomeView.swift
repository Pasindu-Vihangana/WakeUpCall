//
//  HomeView.swift
//  WakeUpCall
//
//  Created by Pasindu Vihangana on 2024-10-14.
//

import SwiftUI

struct Alarm: Identifiable {
    let id = UUID()
    let time: String
    let days: [Day]
    let label: String?
    var isEnabled: Bool
    
    var dayStrings: [String] {
        days.map { $0.rawValue }
    }
}

struct HomeView: View {
    @State private var alarms: [Alarm] = [
        Alarm(time: "7:00 AM", days: [.MON, .TUE, .WED, .THU, .FRI], label: "Work", isEnabled: true),
        Alarm(time: "8:00 PM", days: [.SAT, .SUN], label: "Relax", isEnabled: false),
        Alarm(time: "5:00 AM", days: [.MON, .TUE, .WED, .THU, .FRI], label: "Trainning", isEnabled: true),
    ]

    var body: some View {
        NavigationView {
            List(alarms.indices, id: \.self) { index in
                HStack {
                    VStack(alignment: .leading) {
                        Text(alarms[index].time)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(alarms[index].label ?? "")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Text(alarms[index].dayStrings.joined(separator: ", "))
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Toggle("", isOn: $alarms[index].isEnabled)

                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            .navigationBarTitle("Alarms")
            .navigationBarItems(
                trailing: NavigationLink ("add"){
                    CreateAlarmView()
                }
            )
//                Button(action: {
//                    
//                }) {
//                    Image(systemName: "plus")
//                        .foregroundColor(.blue)
//                }
//            )
        }
    }
}

#Preview {
    HomeView()
}
