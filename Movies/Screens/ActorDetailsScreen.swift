//
//  ActorDetailsScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import SwiftUI

struct ActorDetailsScreen: View {
    //@Environment(\.modelContext) private var modelContext
    let actor: Actor
    
    @State private var selectedMovies: Set<Movie> = []
    var body: some View {
        VStack {
            MovieSelectionView(selectedMovies: $selectedMovies)
                .onAppear {
                    selectedMovies = Set(actor.movies)
                }
        }
        .onChange(of: selectedMovies, {
            actor.movies = Array(selectedMovies)
//            modelContext.insert(actor)
        })
        .navigationTitle(actor.name)
    }
}

