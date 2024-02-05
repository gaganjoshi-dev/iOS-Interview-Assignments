//
//  Category.swift
//  EventList
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let events: [Event]?
    let children: [Category]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case events
        case children = "children"
    }
}
