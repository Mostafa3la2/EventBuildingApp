//
//  CategoriesServices.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

enum CategoriesServices {

    case sharedIntance

    func getCategories() async -> CategoriesModel? {
        let url = URL(string: "https://swensonhe-dev-challenge.s3.us-west-2.amazonaws.com/categories.json")!
        do {
            let categories: CategoriesModel = try await NetworkManager.shared.request(url)
            return categories
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}


