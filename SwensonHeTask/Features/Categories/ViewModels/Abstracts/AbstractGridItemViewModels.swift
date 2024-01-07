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
    var avgBudget: String { get }
    var minBudget: String { get }
    var maxBudget: String { get }
}

