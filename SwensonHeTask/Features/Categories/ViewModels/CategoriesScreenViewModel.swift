//
//  CategoriesScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

class CategoriesScreenViewModel: CategoriesItemsModularViewModel {
    
    @Published var title: String = "Event Builder"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}

class CategoriesScreenDummyViewModel: CategoriesItemsModularViewModel {

    @Published var title: String = "Event Builder"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}
