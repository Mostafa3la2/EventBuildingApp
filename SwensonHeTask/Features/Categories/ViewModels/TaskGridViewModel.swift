//
//  TaskGridViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation


class TaskGridItemViewModel: ModularGridItemViewModel, HasBudget, ObservableObject {

    var cartManager: CartManager

    @Published var added: Bool = false

    var avgBudget: String = "600"

    var minBudget: String = "300"

    var maxBudget: String = "900"

    var title: String = "Task"

    var imageURL: String = "https://picsum.photos/200/300"

    init(cartManager: CartManager) {
        self.cartManager = cartManager
    }
}


