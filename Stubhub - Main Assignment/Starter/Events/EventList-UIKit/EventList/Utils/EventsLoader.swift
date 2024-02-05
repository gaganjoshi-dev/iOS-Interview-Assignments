//
//  EventsLoader.swift
//  EventList
//
//

import Foundation

/// A utility class for loading events from local files
///
/// Example usage:
/// ```
/// let category = try EventsLoader().loadEvents()
/// ```
class EventsLoader {
    /// Error cases when loading local files
    enum EventsLoadingErrors: Error {
        /// This error will be thrown if the file is not found.
        case fileNotFound
        case invalidJSON
        case decodeError
    }

    private let bundle: Bundle
    private let decoder: JSONDecoder

    /// Creates a new instance with the specified bundle and decoder
    /// - parameter bundle: The bundle to look for local files in. Defaults to `Bundle.main`
    /// - parameter decoder: The pre-configured decoder to use. Defaults to a simple `JSONDecoder` without any options.
    init(bundle: Bundle = .main, decoder: JSONDecoder = JSONDecoder()) {
        self.bundle = bundle
        self.decoder = decoder
    }

    /// Tries to load an array of events from a local file.
    ///
    /// - parameter fileName: The file name to load the events from. Defaults to `events`
    /// Example usage:
    /// ```
    /// let category = try EventsLoader().loadEvents()
    /// ```
    func loadEvents(fileName: String = "events") throws -> Category {
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            throw EventsLoadingErrors.fileNotFound
        }


        guard let data = try? Data(contentsOf: url) else {
            throw EventsLoadingErrors.invalidJSON
        }

        guard let decodedConcert = try? decoder.decode(Category.self, from: data) else {
            throw EventsLoadingErrors.decodeError
        }


        return decodedConcert
    }
}
