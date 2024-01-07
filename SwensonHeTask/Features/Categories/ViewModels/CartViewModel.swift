//
//  CartViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class CartManager: ObservableObject {
    @Published var cartItems: Set<CartItem> = []
    @Published var avgBudget: Double = 0
    @Published var categoriesAvgBudget: [Int: Double] = [:]
    func addItemToCart(cartItem: CartItem) {
        if !cartItems.contains(cartItem) {
            self.cartItems.insert(cartItem)
            self.avgBudget+=cartItem.avgBudget ?? 0
            if self.categoriesAvgBudget[cartItem.categoryID!] == nil {
                self.categoriesAvgBudget[cartItem.categoryID!] = cartItem.avgBudget ?? 0
            } else {
                self.categoriesAvgBudget[cartItem.categoryID!]! += cartItem.avgBudget ?? 0
            }
        }
    }
    func removeItemFrom(cartItem: CartItem) {
        if cartItems.contains(cartItem) {
            self.cartItems.remove(cartItem)
            self.avgBudget-=cartItem.avgBudget ?? 0
            if self.categoriesAvgBudget[cartItem.categoryID!] != nil {
                self.categoriesAvgBudget[cartItem.categoryID!]! -= cartItem.avgBudget ?? 0
            }
        }
    }
}

struct CartItem: Hashable {
    var name: String?
    var avgBudget: Double?
    var id: Int?
    var categoryID: Int?
}
