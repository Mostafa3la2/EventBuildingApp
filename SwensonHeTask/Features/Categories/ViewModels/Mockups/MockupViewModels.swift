//
//  MockupViewModels.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

class CategoriesScreenDummyViewModel: CategoriesItemsModularViewModel {

    var minBudget: Double = 10

    var maxBudget: Double = 30

    var cartManager: CartManager

    var dataSource: [any ModularGridItemViewModel]

    @Published var title: String = "Dummy Event Builder"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: Double = 20

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        let category = CategoriesModelElement(id: 1, title: "test", image: "https://picsum.photos/200/300")
        dataSource = Array(repeating: CategoryGridItemViewModel(cartManager: cartManager, category: category), count: 4)
    }
}

class TasksDummyViewModel: CategoriesItemsModularViewModel {


    var cartManager: CartManager

    var dataSource: [any ModularGridItemViewModel]

    @Published var title: String = "Dummy Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: Double = 20

    var minBudget: Double = 10

    var maxBudget: Double = 30

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        let task = TasksModelElement(id: 1, title: "test", minBudget: 100, maxBudget: 300, avgBudget: 200, image: "https://picsum.photos/200/300")
        dataSource = Array(repeating: TaskGridItemViewModel(cartManager: cartManager, task: task, categoryID: 2), count: 4)
    }

}
