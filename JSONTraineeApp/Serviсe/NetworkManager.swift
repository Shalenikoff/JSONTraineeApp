//
//  NetworkManager.swift
//  JSONTraineeApp
//
//  Created by Кирилл Шалеников on 09.09.2023.
//

import Foundation

enum Link: String {
    case rick = "https://rickandmortyapi.com/api/character/1"
    case morty = "https://rickandmortyapi.com/api/character/2"
    case summerSmith = "https://rickandmortyapi.com/api/character/3"
}

enum NerworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getPerson<T: Decodable>(_ type: T.Type, from url: String?,
                   completion: @escaping(
                    Result<T, NerworkError>
                   ) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let person = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type as! T))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
