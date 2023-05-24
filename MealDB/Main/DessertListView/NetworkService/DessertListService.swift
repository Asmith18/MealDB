//
//  DessertService.swift
//  MealDB
//
//  Created by Adam Smith on 5/24/23.
//

import Foundation

struct DessertListService {
    private let apiService = APIService()
    
    func fetchDessertList(from endpoint: ApiEndpoints, completion: @escaping (Result<DessertList, ResultError>) -> Void) {
        guard let finalURL = endpoint.fullURL else {
            completion(.failure(.badURL))
            return
        }
        let urlRequest = URLRequest(url: finalURL)
        apiService.perform(urlRequest) { result in
            switch result {
            case .success(let dessertData):
                do {
                    let dessertList = try JSONDecoder().decode(DessertList.self, from: dessertData)
                    completion(.success(dessertList))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
