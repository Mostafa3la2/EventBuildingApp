//
//  TasksModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

// MARK: - TasksModelElement
struct TasksModelElement: Codable {
    let id: Int?
    let title: String?
    let minBudget, maxBudget, avgBudget: Double?
    let image: String?
}

typealias TasksModel = [TasksModelElement]
