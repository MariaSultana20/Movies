//
//  MovieListScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @State private var isAddMovieScreenPresented: Bool = false
    
    var body: some View {
        MovieListView(movies: movies)
        .toolbar {
            ToolbarItem {
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
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
    }
}
