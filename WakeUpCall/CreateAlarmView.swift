//
//  CreateAlarmView.swift
//  WakeUpCall
//
//  Created by Pasindu Vihangana on 2024-10-16.
//

import SwiftUI

struct CreateAlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTime = Date()
    @State private var selectedDays: [Day] = []
    @State private var label: String = ""
    @State private var selectedSound: String = "Default"
    @State private var isSnoozeEnabled: Bool = false

    var body: some View {
        NavigationView {
            
            VStack {
                // Time Picker
                DatePicker("Select Alarm Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                    .environment(\.locale, Locale(identifier: "en_US_POSIX")) // Ensure 12-hour format
                
                VStack{
                    // Day Selector
                    HStack{
                        Text("Repeat")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        NavigationLink("Days") {
                            DayPickerView()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    
                    // Label Field
                    HStack{
                        Text("Label")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        TextField("Alarm", text: $label)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    
                    // Sound Selection
                    HStack{
                        Text("Sound")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Picker("Sound", selection: $selectedSound) {
                            Text("Default").tag("Default")
                            Text("Chime").tag("Chime")
                            Text("Beep").tag("Beep")
                            Text("Melody").tag("Melody")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(.horizontal)
                    }
                    .padding(.horizontal)

                    
                    // Snooze Option
                    HStack{
                        Toggle("Enable Snooze", isOn: $isSnoozeEnabled)
                            .font(.headline)
                            .padding(.horizontal)

                        Spacer()

                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
            }
            .navigationBarTitle("Create Alarm", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
            .navigationBarItems(trailing: Button("Save") {
                saveAlarm()
                presentationMode.wrappedValue.dismiss()
            })
            
        }
    }

    private func toggleDay(_ day: Day) {
        if selectedDays.contains(day) {
            selectedDays.removeAll { $0 == day }
        } else {
            selectedDays.append(day)
        }
    }

    private func saveAlarm() {
        // Logic to save the alarm
        // You can create an Alarm instance and add it to your alarms array
        print("Alarm set for \(selectedTime) on \(selectedDays) with label: \(label), sound: \(selectedSound), snooze: \(isSnoozeEnabled)")
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    CreateAlarmView()
}
