//
//  CategoryItemsScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class TasksViewModel: CategoriesItemsModularViewModel {

    @Published var cartManager: CartManager
    private var cancellables: Set<AnyCancellable> = []
    var dataSource: [any ModularGridItemViewModel] = []

    @Published var title: String = "Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: Double = 0

    var minBudget: Double = 0

    var maxBudget: Double = 0

    var categoryID: Int?
    init(cartManager: CartManager, categoryID: Int?, categoryName: String?) {
        self.cartManager = cartManager
        self.categoryID = categoryID
        self.title = categoryName ?? ""
        if let categoryID {
            cartManager.$categoriesAvgBudget
                .sink(receiveValue: { dict in
                    self.avgBudget = dict[categoryID] ?? 0
                })
                .store(in: &cancellables)
        }
        for i in cartManager.cartItems {
            minBudget+=i.minBudget ?? 0
            maxBudget+=i.maxBudget ?? 0
        }
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
                    tasks?.forEach{self.dataSource.append(TaskGridItemViewModel(cartManager: self.cartManager, task: $0, categoryID: categoryID))}
                }
            }
        }
    }
}


