//
//  ContentView.swift
//  EventList
//
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = EventListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
