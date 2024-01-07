//
//  CategoryItemsScreenViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation


class TasksViewModel: CategoriesItemsModularViewModel {

    var dataSource: [any ModularGridItemViewModel] = [TaskGridItemViewModel()]

    @Published var title: String = "Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}

class TasksDummyViewModel: CategoriesItemsModularViewModel {

    var dataSource: [any ModularGridItemViewModel] = [TaskGridItemViewModel(title: "Dummy Task"), TaskGridItemViewModel(title: "Dummy Task"), TaskGridItemViewModel(title: "Dummy Task"), TaskGridItemViewModel(title: "Dummy Task")]

    @Published var title: String = "Dummy Category Title"

    @Published var subtitle: String = "Subtitle"

    @Published var avgBudget: String = "$ XXXX"


}
