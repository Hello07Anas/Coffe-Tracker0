//
//  ConfigurationOption.swift
//  CoffeTracker
//
//  Created by Anas Salah on 24/03/2023.
//

import Foundation

struct ConfigurationOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigurationOption(id: UUID(), name: "None", calories: 0)
}
