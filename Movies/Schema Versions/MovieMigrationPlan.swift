//
//  MovieMigrationPlan.swift
//  Movies
//
//  Created by Maria Sultana on 11/26/26.
//

import Foundation
import SwiftData

enum MovieMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [MoviesSchemaV1.self, MoviesSchemaV2.self, MoviesSchemaV3.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2, migrateV2toV3]
    }
    
    static let migrateV1toV2 = MigrationStage.custom(fromVersion: MoviesSchemaV1.self, toVersion: MoviesSchemaV2.self, willMigrate: { context in
        guard let movies = try? context.fetch(FetchDescriptor<MoviesSchemaV1.Movie>()) else { return }

        var duplicates = Set<MoviesSchemaV1.Movie>()
        var unique = Set<String>()
        
        for movie in movies {
            if unique.contains(movie.title) {
                duplicates.insert(movie)
            } else {
                unique.insert(movie.title)
            }
        }
        
        for movie in duplicates {
            movie.title += " \(UUID())"
        }
        
        try? context.save()
    }, didMigrate: nil)
    
    static let migrateV2toV3 = MigrationStage.lightweight(fromVersion: MoviesSchemaV2.self, toVersion: MoviesSchemaV3.self)
}
