//
//  ActorSelectionView.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    @Binding var selectedActors: Set<Actor>
    
    var body: some View {
        List(actors) { actor in
            let isSelected: Bool = selectedActors.contains(actor)
            HStack {
                Image(systemName: isSelected ? "checkmark.square": "square")
                Text(actor.name)
            }
            .onTapGesture {
                if isSelected {
                    selectedActors.remove(actor)
                } else {
                    selectedActors.insert(actor)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var actors = Set<Actor>()
    ActorSelectionView(selectedActors: $actors)
}
