//
//  Animal.swift
//  BlogueSwiftUI
//
//  Created by Yassine Ben-khayat on 2025-03-22.
//
import SwiftUI

struct Animal: Codable, Identifiable, Hashable{
    let id: Int
    let nom: String
    let couleur : String
    let nomImage : String
    
    var swiftUIColor: Color {
        switch couleur.lowercased() {
        case "blue": return .blue
        case "yellow": return .yellow
        case "gray": return .gray
        default: return .primary
        }
    }
}
