//
//  CartViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    func addItemToCart() {

    }
}

struct CartItem: Identifiable {
    let id: UUID
    let name: String
    var quantity: Int
    // Add more properties as needed
}
