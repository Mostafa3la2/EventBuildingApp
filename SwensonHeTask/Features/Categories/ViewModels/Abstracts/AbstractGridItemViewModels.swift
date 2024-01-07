//
//  AbstractGridItemViewModels.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

protocol ModularGridItemViewModel: ObservableObject {
    var title: String { get }
    var imageURL: String { get }
    var cartManager: CartManager {
        get set
    }
}

protocol HasBudget {
    var avgBudget: Double { get }
    var minBudget: Double { get }
    var maxBudget: Double { get }
}

protocol CartHandler {
    func addToCart()
    func removeFromCart()
}
