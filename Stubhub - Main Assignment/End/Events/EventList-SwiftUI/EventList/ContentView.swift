//
//  ContentView.swift
//  EventList
//
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = EventListViewModel()
    @State var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    let events = searchText.isEmpty ? viewModel.
                    
                    ForEach(viewModel.getEvents()) { event in
                        EventRowView(event: event)
                    }
                }
            }
            .navigationBarTitle("Concerts")
            .onAppear {
                viewModel.loadEvents()
            }
        }.navigationViewStyle(.stack)
            .searchable(text: $searchText) {
                            Text("Search")
                        }
            .onChange(of: searchText) { searchText in
                            Task { await viewModel.filterEvents(with: searchText) }
                        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
