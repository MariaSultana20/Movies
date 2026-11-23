//
//  MovieListScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    @State private var isAddActorPresented: Bool = false
    @State private var isAddMovieScreenPresented: Bool = false
    @State private var actorName: String = ""
    
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
            Text("Movies")
                .font(.largeTitle)
            MovieListView(movies: movies)
            Text("Actors")
                .font(.largeTitle)
            ActorListView(actors: actors)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading){
                Button("Add Actor") {
                    isAddActorPresented = true
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    isAddMovieScreenPresented = true
                }
            }
        }
        .sheet(isPresented: $isAddMovieScreenPresented) {
            NavigationStack {
                AddMovieScreen()
            }
        }
        .sheet(isPresented: $isAddActorPresented) {
            Text("Add Actor")
                .font(.largeTitle)
                .presentationDetents([.fraction(0.25)])
            
            TextField("Actor Name", text: $actorName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Save") {
                isAddActorPresented = false
                saveActor()
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
    }
}
