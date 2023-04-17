//
//  MenuSections.swift
//  CoffeTracker
//
//  Created by Anas Salah on 24/03/2023.
//

import Foundation

struct MenuSections: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
}
