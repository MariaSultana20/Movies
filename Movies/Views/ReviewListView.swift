//
//  ReviewListView.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import SwiftUI

struct ReviewListView: View {
    @Environment(\.modelContext) private var modelContext
    
    let reviews: [Review]
    
    private func deleteReview(indexset: IndexSet) {
        indexset.forEach { index in
            let review = reviews[index]
            
            modelContext.delete(review)
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(reviews) { review in
                HStack {
                    Text(review.subject)
                    Spacer()
                    Text(review.body)
                }
            }
            .onDelete(perform: deleteReview)
        }
    }
}

#Preview {
    ReviewListView(reviews: [])
        .modelContainer(for: [Movie.self, Review.self])
}
