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

    @StateObject var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(cartManager)
        .modelContainer(for: Event.self)
    }
}
