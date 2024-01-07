//
//  TaskGridViewModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation


struct TaskGridItemViewModel: ModularGridItemViewModel, HasBudget {
    func add() {

    }

    func subtract() {

    }

    var avgBudget: String = "600"

    var minBudget: String = "300"

    var maxBudget: String = "900"

    var title: String = "Real Task"

    var imageURL: String = "https://picsum.photos/200/300"

}


