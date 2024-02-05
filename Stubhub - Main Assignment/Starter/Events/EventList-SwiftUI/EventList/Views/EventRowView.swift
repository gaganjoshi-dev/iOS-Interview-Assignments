//
//  EventRowView.swift
//  EventList
//
//

import SwiftUI

struct EventRowView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Name: \(event.name ?? "N/A")").font(.body)
            Text("City: \(event.city ?? "N/A")").font(.body)
            Text("Price: \(event.formattedPrice)").font(.body)
            Text("Date: \(event.date ?? "N/A")").font(.body)
        }
    }
}
