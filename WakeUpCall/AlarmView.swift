//
//  AlarmView.swift
//  WakeUpCall
//
//  Created by Pasindu Vihangana on 2024-10-19.
//

import SwiftUI

struct AlarmView: View {
    var alarmTime: Date
    @Binding var isActive: Bool // Binding to control the presentation of this view

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("\(formatDate(alarmTime))")
                    .font(.system(size: 30, weight: .heavy))
                    .fontWeight(.medium)
                Text("\(formatTime(alarmTime))")
                    .font(.system(size: 64, weight: .heavy))
                    .fontWeight(.medium)
            }
            
            Spacer()
            
            Text("⏰ Alarm")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Button(action: {
                // Snooze the alarm
                snoozeAlarm()
                isActive = false
            }) {
                Text("Snooze")
                    .font(.headline)
                    .padding()
                    .frame(minWidth: 200)
                    .background(Color.blue.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
            
            Spacer()
            
            Button(action: {
                // Dismiss the alarm
                isActive = false
            }) {
                Text("Dismiss")
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
            
        }
        .padding()
        .frame(maxWidth: 400)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .onAppear {
            // Play alarm sound or vibration here if needed
        }
    }

    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: date)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: date)
    }

    private func snoozeAlarm() {
        // Implement snooze logic here (e.g., reschedule the alarm for 5 minutes later)
        let snoozeTime = Calendar.current.date(byAdding: .minute, value: 5, to: alarmTime)
        print("Snoozed alarm for \(formatTime(snoozeTime!))")
        // You would typically update your alarm manager here
    }
}

#Preview {
    AlarmView(alarmTime: Date(), isActive: .constant(true))
}
