//
//  MovieListScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

enum Sheet: Identifiable {
    var id: Int {
        hashValue
    }

    case addMovie
    case addActor
    case filter
}

struct MovieListScreen: View {
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    @State private var sheetType: Sheet?
    @State private var actorName: String = ""
    @State private var filterOption: FilterOption = .none
    
    private func saveActor() {
        let actor = Actor(name: actorName)
        modelContext.insert(actor)
        
        do {
            try modelContext.save()
        } catch {
            print("Actor: \(error.localizedDescription)")
        }
        actorName = ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("Movies")
                    .font(.largeTitle)
                Spacer()
                Button("Filter") {
                    sheetType = .filter
                }
            }
            MovieListView(filterOption: filterOption)
            Text("Actors")
                .font(.largeTitle)
            ActorListView(actors: actors)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading){
                Button("Add Actor") {
                    sheetType = .addActor
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    sheetType = .addMovie
                }
            }
        }
        .sheet(item: $sheetType){ sheetType in
            switch sheetType {
            case .addMovie:
                NavigationStack {
                    AddMovieScreen()
                }
            case .addActor:
                Text("Add Actor")
                    .font(.largeTitle)
                    .presentationDetents([.fraction(0.25)])
                
                TextField("Actor Name", text: $actorName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Save") {
                    saveActor()
                    self.sheetType = nil
                }
            case .filter:
                FilterSelectionScreen(filterOption: $filterOption)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
    }
}
