//
//  MoviesApp.swift
//  Movies
//
//  Created by Mohammad Azam on 6/6/23.
//

import SwiftUI
import SwiftData

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AddMovieScreen()
            }.modelContainer(for: [Movie.self])
        }
    }
}
