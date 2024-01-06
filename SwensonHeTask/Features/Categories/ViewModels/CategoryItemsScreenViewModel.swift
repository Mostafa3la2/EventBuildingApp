//
//  CategoryItemsScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

class CategoryItemsViewModel: CategoriesItemsModularViewModel {
    
    @Published var title: String = "Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}

class CategoryItemsDummyViewModel: CategoriesItemsModularViewModel {

    @Published var title: String = "Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}
