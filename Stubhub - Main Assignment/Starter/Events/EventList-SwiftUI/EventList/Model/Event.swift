//
//  Event.swift
//  EventList
//

import Foundation

struct Event: Codable, Identifiable {
    let id: Int?
    let name: String?
    let venueName: String?
    let city: String?
    let price: Double?
    let distanceFromVenue: Double?
    let date: String?

    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        return formatter.string(from: NSNumber(value: price ?? 0)) ?? "$0"
    }
}
