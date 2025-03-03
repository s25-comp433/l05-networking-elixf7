//
//  BasketballGamesApp.swift
//  BasketballGames
//
//  Created by Samuel Shi on 2/27/25.
//

import SwiftUI

struct BasketballGame: Codable, Identifiable {
    let id: Int
    let opponent: String
    let score: Score
    let date: String
    let isHomeGame: Bool
    let team: String
}

struct Score: Codable {
    let unc: Int
    let opponent: Int
}

@main
struct BasketballGamesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
