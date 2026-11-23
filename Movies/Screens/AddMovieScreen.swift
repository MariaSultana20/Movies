//
//  AddMovieScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    @State var title: String = ""
    @State var year: Int?
    @State private var selectedActors: Set<Actor> = []
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace
    }
    var body: some View {
        Form {
            TextField("Movie title", text: $title)
            TextField("Release year", value: $year, format: .number)
            Section("Select Actors") {
                ActorSelectionView(selectedActors: $selectedActors)
            }
        }
        .navigationTitle(Text("Add Movie"))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let movie = Movie(title: title, year: year ?? 0)
                    movie.actors = Array(selectedActors)
                    modelContext.insert(movie)
                    
                    do {
                        try modelContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }.disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddMovieScreen()
            .modelContainer(for: [Movie.self])
    }
}
