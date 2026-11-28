//
//  FilterSelectionScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/24/26.
//

import SwiftUI

enum FilterOption {
    case title(String)
    case reviewCount(Int)
    case actorCount(Int)
    case genre(Genre?)
    case none
}

struct FilterSelectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle = ""
    @State private var numberOfReviews: Int?
    @State private var numberOfActors: Int?
    @State private var genre: Genre?
    @Binding var filterOption: FilterOption
    
    var body: some View {
        Form {
            Section("Filter by movie title") {
                TextField("Movie title", text: $movieTitle)
                Button("Search") {
                    filterOption = .title(movieTitle)
                    dismiss()
                }
            }
            Section("Filter by number of reviews") {
                TextField("Number of reviews", value: $numberOfReviews, format: .number)
                Button("Search") {
                    filterOption = .reviewCount(numberOfReviews ?? 0)
                    dismiss()
                }
            }
            Section("Filter by number of actors") {
                TextField("Number of actors", value: $numberOfActors, format: .number)
                Button("Search") {
                    filterOption = .actorCount(numberOfActors ?? 0)
                    dismiss()
                }
            }
            Section("Filter by genre") {
                Picker("Select a Genre", selection: $genre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name).tag(genre)
                    }
                }
                Button("Search") {
                    filterOption = .genre(genre)
                    dismiss()
                }
            }
        }
    }
}

