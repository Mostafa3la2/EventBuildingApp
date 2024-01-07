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
    var avgBudget: String {
        get set
    }
    var dataSource: [any ModularGridItemViewModel] {
        get set
    }
}
