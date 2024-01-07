//
//  CategoryItemsScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation


class TasksViewModel: CategoriesItemsModularViewModel {

    var cartManager: CartManager

    var dataSource: [any ModularGridItemViewModel]

    @Published var title: String = "Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: Double = 0

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        dataSource = [TaskGridItemViewModel(cartManager: cartManager)]
    }
}

class TasksDummyViewModel: CategoriesItemsModularViewModel {

    var cartManager: CartManager

    var dataSource: [any ModularGridItemViewModel]

    @Published var title: String = "Dummy Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: Double = 0

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        dataSource = Array(repeating: TaskGridItemViewModel(cartManager: cartManager), count: 4)
    }

}
