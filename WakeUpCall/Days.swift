//
//  Days.swift
//  WakeUpCall
//
//  Created by Pasindu Vihangana on 2024-10-16.
//

import Foundation

enum Day: String, CaseIterable {
    case SUN, MON, TUE, WED, THU, FRI, SAT
    
    // Computed property to get the full name of the day
    var fullName: String {
        switch self {
        case .SUN: return "Sunday"
        case .MON: return "Monday"
        case .TUE: return "Tuesday"
        case .WED: return "Wednesday"
        case .THU: return "Thursday"
        case .FRI: return "Friday"
        case .SAT: return "Saturday"
        }
    }
}
