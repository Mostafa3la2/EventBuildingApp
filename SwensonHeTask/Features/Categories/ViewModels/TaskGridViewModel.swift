//
//  TaskGridViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

class TaskGridItemViewModel: ModularGridItemViewModel, HasBudget, ObservableObject, CartHandler {


    func addToCart() {
        var cartItem = CartItem(name: self.title, avgBudget: self.avgBudget, id: self.id)
        self.cartManager.addItemToCart(cartItem: cartItem)
    }

    func removeFromCart() {
        var cartItem = CartItem(name: self.title, avgBudget: self.avgBudget, id: self.id)
        self.cartManager.removeItemFrom(cartItem: cartItem)
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

extension TaskGridItemViewModel: Identifiable, Hashable {

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    public static func == (lhs: TaskGridItemViewModel, rhs: TaskGridItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
