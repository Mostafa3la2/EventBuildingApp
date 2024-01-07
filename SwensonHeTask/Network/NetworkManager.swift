//
//  NetworkManager.swift
//  SwensonHeTask
//
//  Created by Mostafa Alaa on 07/01/2024.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()

    private init() {
        configureURLSession()
    }
    private func configureURLSession() {
        let cache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 50 * 1024 * 1024, diskPath: nil)
        URLSession.shared.configuration.urlCache = cache
        URLSession.shared.configuration.requestCachePolicy = .reloadRevalidatingCacheData
    }
    func request<T: Decodable>(_ url: URL) async throws -> T {
        guard let data = try? await URLSession.shared.data(from: url).0 else {
            throw NetworkError.requestFailed
        }

        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw NetworkError.decodingError
        }
    }
}
