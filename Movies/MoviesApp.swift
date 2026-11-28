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
//    let container: ModelContainer
//    
//    init() {
//        do {
//            self.container = try ModelContainer(
//                for: Movie.self,
//                migrationPlan: MovieMigrationPlan.self,
//                configurations: ModelConfiguration(for: Movie.self)
//            )
//        } catch {
//            fatalError("Failed to initialize ModelContainer: \(error.localizedDescription)")
//        }
//    }
//    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieListScreen()
            }.modelContainer(for: [Movie.self, Actor.self])
        }
    }
}
