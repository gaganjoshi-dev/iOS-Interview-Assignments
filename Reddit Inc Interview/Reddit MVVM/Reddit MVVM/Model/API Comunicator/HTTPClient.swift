//
//  HTTPClient.swift
//  Reddit MVVM
//
//  Created by gagan joshi on 2024-02-19.
//
import Foundation


enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
    case serverError(statusCode : Int)
}

class HTTPClient {
    
    
    static func fetchCharacters(page: Int) async throws -> [Character] {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=" + "\(page)") else {
            throw NetworkError.urlError
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
     
        if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode != 200 {
            throw NetworkError.serverError(statusCode: statusCode)
        }
        let characterResponse = try? JSONDecoder().decode(CharacterResponse.self, from: data)
        guard let characters = characterResponse?.results else  { throw NetworkError.decodingError }
        return characters
        
        
        
    }

    
}
