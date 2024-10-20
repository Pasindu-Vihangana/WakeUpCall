//
//  CodeEntryView.swift
//  WakeUpCall
//
//  Created by Pasindu Vihangana on 2024-10-19.
//

import SwiftUI

struct CodeEntryView: View {
    @State private var pinCode: String = ""
    
    // Define the keypad layout
    let keypadLayout: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["*", "0", "#"]
    ]
    
    var body: some View {
        VStack {
            // Header (Navigation Menu)
            HStack {
                Text(pinCode)
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                    .padding()
            }
            .frame(width: 230, height: 70)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            
            // Numeric Keypad
            VStack(spacing: 10) {
                ForEach(keypadLayout, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { number in
                            if (number == "#") {
                                // Submit Button
                                Button(action: {
                                    print("Submitted PIN: \(pinCode)")
                                    // Handle the submission of the PIN here
                                }) {
                                    HStack {
                                        Image(systemName: "checkmark")
                                    }
                                    .frame(width: 70, height: 70)
                                    .background(Color.green.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                            }
                            else if (number == "*") {
                                // Clear Button
                                Button(action: {
                                    print("Submitted PIN: \(pinCode)")
                                    // Handle the clear here
                                }) {
                                    Text("C")
                                        .font(.largeTitle)
                                        .frame(width: 70, height: 70)
                                        .background(Color.red.opacity(0.8))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                            else
                            {
                                // Number Button
                                Button(action: {
                                    pinCode += number
                                }) {
                                    Text(number)
                                        .font(.largeTitle)
                                        .frame(width: 70, height: 70)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    CodeEntryView()
}
