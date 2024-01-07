//
//  SwensonHeTaskApp.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI
import SwiftData

@main
struct SwensonHeTaskApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    @StateObject var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(cartManager)
        .modelContainer(sharedModelContainer)
    }
}
