//
//  EditMovieScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

struct EditMovieScreen: View {
    @Environment(\.modelContext) private var modelContext
    let movie: Movie
    
    @State private var title: String = ""
    @State private var year: Int?
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Button("Update") {
                guard let year else { return }
                movie.title = title
                movie.year = year
                
                do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .onAppear() {
            title = movie.title
            year = movie.year
        }
    }
}

//
//#Preview {
//    EditMovieScreen()
//}
