//
//  ContentView.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        EventBuilderNavigation(cart: _cartManager)
    }
}

#Preview {
    @StateObject var cartManager = CartManager()

    return ContentView()
        .environmentObject(cartManager)
        .modelContainer(for: Item.self, inMemory: true)
}
