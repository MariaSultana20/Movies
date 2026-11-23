//
//  AddReviewScreen.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import SwiftUI
import SwiftData

struct AddReviewScreen: View {
    let movie: Movie
    @Environment(\.modelContext) private var modelContext
    
    @Environment(\.dismiss) var dismiss
    @State private var subject: String = ""
    @State private var description: String = ""
    
    var isFormValid: Bool {
        !subject.isEmptyOrWhiteSpace && !description.isEmptyOrWhiteSpace
    }
    
    var body: some View {
        Form {
            TextField("Subject", text: $subject)
            TextField("Description", text: $description)
        }
        .navigationTitle("Add Review")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    let review = Review(subject: subject, body: description)
                    review.movie = movie
                    movie.reviews?.append(review)
                    
                    modelContext.insert(review)
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

//#Preview {
//    AddReviewScreen()
//}
