//
//  ActorCellView.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import SwiftUI
import SwiftData

struct ActorCellView: View {
    let actor: Actor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(actor.name)
            Text(actor.movies.map { $0.title }, format: .list(type: .and))
                .font(.caption)
        }
    }
}

#Preview {
    let actor = Actor(name: "Jim carry")
    ActorCellView(actor: actor)
}
