//
//  CategoriesScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class CategoriesScreenViewModel: CategoriesItemsModularViewModel {

    var cartManager: CartManager

    var dataSource: [any ModularGridItemViewModel]

    @Published var title: String = "Event Builder"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        dataSource = [CategoryGridItemViewModel(cartManager: cartManager)]
    }
}

class CategoriesScreenDummyViewModel: CategoriesItemsModularViewModel {

    var cartManager: CartManager

    var dataSource: [any ModularGridItemViewModel]

    @Published var title: String = "Dummy Event Builder"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        dataSource = Array(repeating: CategoryGridItemViewModel(cartManager: cartManager), count: 4)
    }
}
