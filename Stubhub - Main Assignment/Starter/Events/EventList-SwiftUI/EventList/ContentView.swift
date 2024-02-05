//
//  ContentView.swift
//  EventList
//
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = EventListViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search")

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

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)

            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
