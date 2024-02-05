//
//  EventListViewModel.swift
//  EventList
//
//

import Combine
import SwiftUI

class EventListViewModel: ObservableObject {
    @Published private var events: [Event] = []
    @Published private var searchedEvents: [Event] = []

    private let eventLoader: EventsLoader

    init(_ eventLoader: EventsLoader = EventsLoader()) {
        self.eventLoader = eventLoader
    }

    func loadEvents() {
        guard let category = try? eventLoader.loadEvents() else {
            events = []
            return
        }

        events = retrieveEvents(category)
    }

    private func retrieveEvents(_ category: Category) -> [Event] {
        // Fetch all events in the concert without explicitly determining the depth
        return []
    }

    func getEvents() -> [Event] {
        return (!searchedEvents.isEmpty) ? searchedEvents : events
    }
}
