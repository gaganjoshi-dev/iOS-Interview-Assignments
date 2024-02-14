//
//  EventListViewModel.swift
//  EventList
//
//

import Combine
import SwiftUI

@MainActor
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
        
        var arrayEvents = [Event]()
        var queue  = [Category]()
        queue.append(category)
        while !queue.isEmpty {
            let currentCategory = queue.removeFirst()
            let arrayChildren : [Category] = currentCategory.children ?? []
            if arrayChildren.isEmpty {
                arrayEvents.append(contentsOf: currentCategory.events ?? [])
            }
            else {
                queue.append(contentsOf: arrayChildren)
            }
        }
        return arrayEvents
    }

    func getEvents() -> [Event] {
        
       
        return (!searchedEvents.isEmpty) ? searchedEvents : events
    }
    
    
    func filterEvents(with text: String) async {

        if !text.isEmpty {
            
            DispatchQueue.main.async {
               
                self.searchedEvents = self.events.filter { $0.name?.localizedCaseInsensitiveContains(text) == true }
            }

           
        }
        else {
            searchedEvents = []
        }
        
    }
}
