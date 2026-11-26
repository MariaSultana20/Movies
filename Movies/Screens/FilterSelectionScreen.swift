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
    case none
}

struct FilterSelectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle = ""
    @State private var numberOfReviews: Int?
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
        }
    }
}

