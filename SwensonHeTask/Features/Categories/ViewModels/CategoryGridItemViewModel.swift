//
//  GridItemViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation
import Combine

class CategoryGridItemViewModel: ModularGridItemViewModel, ObservableObject {
    var cartManager: CartManager
    
    var title: String = "Category"

    var imageURL: String = "https://picsum.photos/200/300"

    init(cartManager: CartManager, category: CategoriesModelElement) {
        self.cartManager = cartManager
        self.title = category.title ?? ""
        self.imageURL = category.image ?? ""
    }
}
