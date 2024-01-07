//
//  AbstractGridItemViewModels.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

protocol ModularGridItemViewModel: ObservableObject {
    var title: String { get }
    var imageURL: String { get }
}

protocol HasBudget {
    var avgBudget: String { get }
    var minBudget: String { get }
    var maxBudget: String { get }
}

protocol CanAddOrSubtract {
    func operationDone(added: Bool)
}
