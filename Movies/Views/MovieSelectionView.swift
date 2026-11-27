//
//  MovieSelectionView.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import SwiftUI
import SwiftData

struct MovieSelectionView: View {
    @Query(sort: \Movie.name, order: .forward) private var movies: [Movie]
    @Binding var selectedMovies: Set<Movie>
    
    var body: some View {
        List(movies) { movie in
            let isSelected = selectedMovies.contains(movie)
            HStack {
                Image(systemName: isSelected ? "checkmark.square": "square")
                Text(movie.name)
            }
            .onTapGesture {
                if isSelected {
                    selectedMovies.remove(movie)
                } else {
                    selectedMovies.insert(movie)
                }
            }
        }
    }
}

//#Preview {
//    MovieSelectionView()
//}
