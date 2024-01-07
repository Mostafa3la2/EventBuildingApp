//
//  GridItemViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class CategoryGridItemViewModel: ModularGridItemViewModel, ObservableObject {

    var id: Int?
    
    var cartManager: CartManager
    
    var title: String? = "Category"

    var imageURL: String? = "https://picsum.photos/200/300"

    init(cartManager: CartManager, category: CategoriesModelElement) {
        self.cartManager = cartManager
        self.title = category.title
        self.imageURL = category.image
        self.id = category.id
    }
}
extension CategoryGridItemViewModel: Identifiable, Hashable {

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    public static func == (lhs: CategoryGridItemViewModel, rhs: CategoryGridItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
