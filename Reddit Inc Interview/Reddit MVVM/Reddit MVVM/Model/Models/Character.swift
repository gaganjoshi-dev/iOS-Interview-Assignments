//
//  Character.swift
//  Reddit MVVM
//
//  Created by gagan joshi on 2024-02-19.
//

import Foundation

struct Character: Codable, Equatable {
    /// The unique identifier for the character.
    let id: Int
    
    /// The name of the character.
    let name: String
    
    /// The URL to the character's image.
    let image: String
    
    /// The status of the character.
    let status: String

    /// The species of the character.
    let species: String
 
    
}


/// This structure conforms to the `Codable` protocol and contains an array of `Character` instances.
struct CharacterResponse: Codable {
    /// An array of `Character` instances.
    let results: [Character]
}
