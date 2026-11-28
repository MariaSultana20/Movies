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

    @Binding var filterSelectionConfig: FilterSelectionConfig
    
    var body: some View {
        Form {
            Section("Filter by movie title") {
                TextField("Movie title", text: $filterSelectionConfig.movieTitle)
                Button("Search") {
                    filterSelectionConfig.filter = .title(filterSelectionConfig.movieTitle)
                    dismiss()
                }
            }
            Section("Filter by number of reviews") {
                TextField("Number of reviews", value: $filterSelectionConfig.numberOfReviews, format: .number)
                Button("Search") {
                    filterSelectionConfig.filter = .reviewCount(filterSelectionConfig.numberOfReviews ?? 0)
                    dismiss()
                }
            }
            Section("Filter by number of actors") {
                TextField("Number of actors", value: $filterSelectionConfig.numberOfActors, format: .number)
                Button("Search") {
                    filterSelectionConfig.filter = .actorCount(filterSelectionConfig.numberOfActors ?? 0)
                    dismiss()
                }
            }
            Section("Filter by genre") {
                Picker("Select a Genre", selection: $filterSelectionConfig.genre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name).tag(genre)
                    }
                }
                Button("Search") {
                    filterSelectionConfig.filter = .genre(filterSelectionConfig.genre)
                    dismiss()
                }
            }
        }
    }
}

