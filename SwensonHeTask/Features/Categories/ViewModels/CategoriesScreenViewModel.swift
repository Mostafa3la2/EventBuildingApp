//
//  CategoriesScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class CategoriesScreenViewModel: CategoriesItemsModularViewModel {

    @Published var cartManager: CartManager
    private var cancellables: Set<AnyCancellable> = []

    @Published var dataSource: [any ModularGridItemViewModel] = []

    var title: String = "Event Builder"

    var subtitle: String = "Add to your event to view our cost estimate."

    @Published var avgBudget: Double = 0
    var minBudget: Double = 0

    var maxBudget: Double = 0

    init(cartManager: CartManager) {
        self.cartManager = cartManager
        cartManager.$avgBudget
                    .assign(to: \.avgBudget, on: self)
                    .store(in: &cancellables)
        self.getCategories()
        for i in cartManager.cartItems {
            minBudget+=i.minBudget ?? 0
            maxBudget+=i.maxBudget ?? 0
        }
    }
    func getCategories() {
        Task {
            do {
                let categories = await CategoriesServices.sharedIntance.getCategories()
                DispatchQueue.main.async {
                    categories?.forEach{self.dataSource.append(CategoryGridItemViewModel(cartManager: self.cartManager, category: $0))}
                }
            }
        }
    }
}

