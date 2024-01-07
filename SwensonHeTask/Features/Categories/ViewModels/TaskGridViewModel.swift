//
//  TaskGridViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation


class TaskGridItemViewModel: ModularGridItemViewModel, HasBudget, ObservableObject, CartHandler {

    func addToCart() {
        self.cartManager.addItemToCart(cartItem: CartItem(name: self.title, avgBudget: self.avgBudget))
    }

    func removeFromCart() {
        self.cartManager.removeItemFrom(cartItem: CartItem(name: self.title, avgBudget: self.avgBudget))
    }

    var id: Int?

    var cartManager: CartManager

    @Published var added: Bool = false

    var avgBudget: Double? = 600

    var minBudget: Double? = 300

    var maxBudget: Double? = 900

    var title: String? = "Task"

    var imageURL: String? = "https://picsum.photos/200/300"

    init(cartManager: CartManager, task: TasksModelElement) {
        self.cartManager = cartManager
        self.avgBudget = task.avgBudget
        self.minBudget = task.minBudget
        self.maxBudget = task.maxBudget
        self.title = task.title
        self.imageURL = task.image
        self.id = task.id
    }
}


