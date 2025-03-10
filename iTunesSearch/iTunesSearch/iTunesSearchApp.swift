import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

@main
struct iTunesSearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
