//
//  CategoriesScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

class CategoriesScreenViewModel: CategoriesItemsModularViewModel {


    var dataSource: [any ModularGridItemViewModel] = [CategoryGridItemViewModel()]

    @Published var title: String = "Event Builder"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}

class CategoriesScreenDummyViewModel: CategoriesItemsModularViewModel {

    var dataSource: [any ModularGridItemViewModel] = [CategoryGridItemViewModel(title: "Dummy Category"), CategoryGridItemViewModel(title: "Dummy Category"), CategoryGridItemViewModel(title: "Dummy Category"), CategoryGridItemViewModel(title: "Dummy Category")]

    @Published var title: String = "Dummy Event Builder"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}
