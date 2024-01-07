//
//  CategoryItemsScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class TasksViewModel: CategoriesItemsModularViewModel {

    var cartManager: CartManager
    private var cancellables: Set<AnyCancellable> = []
    var dataSource: [any ModularGridItemViewModel] = []

    @Published var title: String = "Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: Double = 0

    var categoryID: Int?

    init(cartManager: CartManager, categoryID: Int?) {
        self.cartManager = cartManager
        self.categoryID = categoryID
        cartManager.$avgBudget
                    .assign(to: \.avgBudget, on: self)
                    .store(in: &cancellables)
        self.getTasksInCategory()
    }

    func getTasksInCategory() {
        guard let categoryID else {
            return
        }
        Task {
            do {
                let tasks = await CategoriesServices.sharedIntance.getTasksInCategory(categoryId: categoryID)
                DispatchQueue.main.async {
                    tasks?.forEach{self.dataSource.append(TaskGridItemViewModel(cartManager: self.cartManager, task: $0))}
                }
            }
        }
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
        let task = TasksModelElement(id: 1, title: "test", minBudget: 100, maxBudget: 300, avgBudget: 200, image: "https://picsum.photos/200/300")
        dataSource = Array(repeating: TaskGridItemViewModel(cartManager: cartManager, task: task), count: 4)
    }

}
