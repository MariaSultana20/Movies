//
//  FilterSelectionScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/24/26.
//

import SwiftUI

enum FilterOption {
    case title(String)
    case none
}

struct FilterSelectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle = ""
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
        }
    }
}

