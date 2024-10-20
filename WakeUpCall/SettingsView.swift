//
//  SettingsView.swift
//  WakeUpCall
//
//  Created by Pasindu Vihangana on 2024-10-20.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var pinCode: String = "****" // Placeholder for current PIN code
    @State private var alarmVolume: Double = 50.0
    @State private var notificationsEnabled: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                // PIN Code Management Section
                Section(header: Text("PIN Code Management").font(.headline)) {
                    HStack {
                        Text("Current PIN Code:")
                        Spacer()
                        Text(pinCode)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    NavigationLink(destination: ChangePinCodeView()) {
                        Text("Change or Reset PIN Code")
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
                
                // Other App Settings Section
                Section(header: Text("Other App Settings").font(.headline)) {
                    HStack {
                        Text("Alarm Volume")
                        Spacer()
                        Slider(value: $alarmVolume, in: 0...100, step: 1)
                            .accentColor(.blue)
                    }
                    .padding()

                    HStack {
                        Text("Notifications")
                        Spacer()
                        Toggle(isOn: $notificationsEnabled) {
                            Text(notificationsEnabled ? "Enabled" : "Disabled")
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(leading: Button("Back") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct ChangePinCodeView: View {
    @State private var newPinCode: String = ""

    var body: some View {
        VStack {
            Text("Change or Reset PIN Code")
                .font(.headline)
                .padding()

            SecureField("Enter New PIN Code", text: $newPinCode)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Logic to change or reset the PIN code
                print("New PIN code set: \(newPinCode)")
            }) {
                Text("Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
