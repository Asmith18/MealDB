//
//  APIService.swift
//  MealDB
//
//  Created by Adam Smith on 5/23/23.
//

import Foundation

struct APIService {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, ResultError>) -> Void) {
        URLSession.shared.dataTask(with: request) { dessertData, response, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("completed with a response of \(response.statusCode)")
            }
            guard let dessertData = dessertData else {
                completion(.failure(.noData))
                return
            }
            completion(.success(dessertData))
        }.resume()
    }
}
