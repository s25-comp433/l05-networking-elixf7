//
//  ContentView.swift
//  BasketballGames
//
//  Created by Samuel Shi on 2/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var games: [BasketballGame] = []
    
    var body: some View {
        NavigationView {
            List(games) { game in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("\(game.team) Game")
                            .font(.headline)
                        Spacer()
                        Text(game.date)
                            .font(.subheadline)
                    }
                    Text("Opponent: \(game.opponent)")
                        .font(.subheadline)
                    
                    Text("Score: UNC \(game.score.unc) - Opponent \(game.score.opponent)")
                        .font(.subheadline)
                    
                    Text("Location: \(game.isHomeGame ? "Home" : "Away")")
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("UNC Basketball")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.samuelshi.com/uncbasketball") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedGames = try? JSONDecoder().decode([BasketballGame].self, from: data) {
                games = decodedGames
            } else {
                print("Failed to decode response")
            }
        } catch {
            print("Error fetching data")
        }
    }
}

struct BasketballGamesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
