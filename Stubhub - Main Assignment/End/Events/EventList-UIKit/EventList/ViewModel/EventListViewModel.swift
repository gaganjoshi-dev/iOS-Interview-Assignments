//
//  EventListViewModel.swift
//  EventList
//
//

/// The event list view model delegate
protocol EventListViewModelDelegate: AnyObject {
    func didUpdateEvents(_ sender: EventListViewModel)
}

/// The event list view model
class EventListViewModel {
    weak var delegate: EventListViewModelDelegate?

    private var events = [Event]()

    var filteredEvents: [Event] = [] {
        didSet {
            delegate?.didUpdateEvents(self)
        }
    }

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
        filteredEvents = events

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
    
    

    
    
    
    func filterEvents(with text: String)  {

        if !text.isEmpty {
            filteredEvents = events.filter { $0.name?.localizedCaseInsensitiveContains(text) == true }
        }
        else {
            filteredEvents = events
        }
        
    }

    func getEvents() -> [Event] {
        return (!filteredEvents.isEmpty) ? filteredEvents : events
    }
}


