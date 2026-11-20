//
//  MovieListScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Query var movies: [Movie]
    @State var isAddMovieScreenPresented: Bool = false
    
    var body: some View {
        List(movies) { movie in
            Text(movie.title)
        }
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
