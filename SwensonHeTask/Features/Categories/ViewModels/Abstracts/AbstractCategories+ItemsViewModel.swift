//
//  AbstractCategories+ItemsVM.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 06/01/2024.
//

import Foundation

protocol CategoriesItemsModularViewModel: ObservableObject {
    var title: String {
        get set
    }
    var subtitle: String {
        get set
    }
    var avgBudget: Double {
        get set
    }
    var minBudget: Double {
        get set
    }
    var maxBudget: Double {
        get set
    }
    var dataSource: [any ModularGridItemViewModel] {
        get set
    }

    var cartManager: CartManager {
        get set
    }
}
