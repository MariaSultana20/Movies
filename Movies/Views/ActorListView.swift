//
//  ActorListView.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import SwiftUI
import SwiftData

struct ActorListView: View {
    let actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            Text(actor.name)
        }
    }
}

#Preview {
    ActorListView(actors: [])
}
