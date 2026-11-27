//
//  MovieDetailsScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import SwiftUI
import SwiftData

struct MovieDetailsScreen: View {
    @Environment(\.modelContext) private var modelContext
    let movie: Movie
    
    @State private var title: String = ""
    @State private var year: Int?
    @State private var showReviewScreen: Bool = false
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Button("Update") {
                guard let year else { return }
                movie.name = title
                movie.year = year
                
                do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }.buttonStyle(.borderless)
            
            Section("Reviews") {
                Button(action: {
                    showReviewScreen = true
                }) {
                    Image(systemName: "plus")
                }
                
                if movie.reviews.isEmpty {
                    ReviewListView(reviews: movie.reviews)
                } else {
                    ContentUnavailableView {
                        Text("No reviews yet")
                    }
                }
            }
            
            Section("Actors") {
                if !movie.actors.isEmpty {
                    List(movie.actors) { actor in
                        ActorCellView(actor: actor)
                    }
                } else {
                    ContentUnavailableView {
                        Text("No actors yet")
                    }
                }
            }
        }
        .onAppear() {
            title = movie.name
            year = movie.year
        }
        .sheet(isPresented: $showReviewScreen) {
            NavigationStack{
                AddReviewScreen(movie: movie)
            }
        }
    }
}

//
//#Preview {
//    EditMovieScreen()
//}
