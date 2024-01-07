//
//  TaskGridViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

class TaskGridItemViewModel: ModularGridItemViewModel, HasBudget, ObservableObject, CartHandler {


    func addToCart() {
        let cartItem = CartItem(name: self.title, avgBudget: self.avgBudget, minBudget: self.minBudget, maxBudget: self.maxBudget, id: self.id, categoryID: categoryID)
        self.cartManager.addItemToCart(cartItem: cartItem)
    }

    func removeFromCart() {
        let cartItem = CartItem(name: self.title, avgBudget: self.avgBudget, minBudget: self.minBudget, maxBudget: self.maxBudget, id: self.id, categoryID: categoryID)
        self.cartManager.removeItemFrom(cartItem: cartItem)
    }

    var id: Int?

    var cartManager: CartManager

    @Published var added: Bool = false

    var avgBudget: Double? = 0

    var minBudget: Double? = 0

    var maxBudget: Double? = 0

    var title: String? = "Task"

    var imageURL: String? = "https://picsum.photos/200/300"

    var categoryID: Int?

    init(cartManager: CartManager, task: TasksModelElement, categoryID: Int) {
        self.cartManager = cartManager
        self.avgBudget = task.avgBudget
        self.minBudget = task.minBudget
        self.maxBudget = task.maxBudget
        self.title = task.title
        self.imageURL = task.image
        self.id = task.id
        self.categoryID = categoryID
    }
}

extension TaskGridItemViewModel: Identifiable, Hashable {

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    public static func == (lhs: TaskGridItemViewModel, rhs: TaskGridItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
