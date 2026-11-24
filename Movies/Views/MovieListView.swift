//
//  MovieListView.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    @Query private var movies: [Movie]
    let filterOption: FilterOption
    
    init(filterOption: FilterOption) {
        self.filterOption = filterOption
        
        switch filterOption {
        case .title(let movieTitle):
            _movies = Query(filter: #Predicate<Movie> { $0.title.contains(movieTitle) })
        case .none:
            _movies = Query()
        }
    }
    
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    private func deleteMovie(indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movies[index]
            
            modelContext.delete(movie)
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: movie) {
                    HStack {
                        Text(movie.title)
                        Spacer()
                        Text(movie.year.description)
                    }
                }
            }
            .onDelete(perform: deleteMovie)
        }
        .navigationDestination(for: Movie.self) { movie in
            MovieDetailsScreen(movie: movie)
        }
    }
}

#Preview {
    MovieListView(filterOption: .none)
}
