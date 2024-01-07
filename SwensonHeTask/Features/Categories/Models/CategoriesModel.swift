//
//  CategoriesModel.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

// MARK: - CategoriesModelElement
struct CategoriesModelElement: Codable {
    let id: Int?
    let title: String?
    let image: String?
}

typealias CategoriesModel = [CategoriesModelElement]
