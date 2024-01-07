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

    func getTasksInCategory(categoryId: Int) async -> TasksModel? {
        var requestURL = "https://swensonhe-dev-challenge.s3.us-west-2.amazonaws.com/categories/{0}.json"
        requestURL = requestURL.replacingOccurrences(of: "{0}", with: "\(categoryId)")
        let url = URL(string: requestURL)!
        do {
            let tasks: TasksModel = try await NetworkManager.shared.request(url)
            return tasks
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}


