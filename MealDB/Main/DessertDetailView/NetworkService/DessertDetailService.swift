//
//  DessertDetailService.swift
//  MealDB
//
//  Created by Adam Smith on 5/30/23.
//

import Foundation

struct DessertDetailService {
    private let apiService = APIService()
    
    func fetchDessertDetails(from endpoint: ApiEndpoints, completion: @escaping (Result<Dessert, ResultError>) -> Void) {
        guard let finalURL = endpoint.fullURL else {
            completion(.failure(.badURL))
            return
        }
        let urlRequest = URLRequest(url: finalURL)
        apiService.perform(urlRequest) { result in
            switch result {
            case .success(let details):
                do {
                    let dessertDetails = try JSONDecoder().decode(Dessert.self, from: details)
                    completion(.success(dessertDetails))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
