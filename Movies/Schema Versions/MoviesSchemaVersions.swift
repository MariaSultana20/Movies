//
//  MoviesSchemaVersions.swift
//  Movies
//
//  Created by Maria Sultana on 11/26/26.
//

import Foundation
import SwiftData

enum MoviesSchemaV1: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Movie.self]
    }
    
    static let versionIdentifier: Schema.Version = .init(0, 0, 0)
    
    @Model
    final class Movie {
        var title: String
        var year: Int
        
        var reviewCount: Int {
            reviews.count
        }
        
        var actorCount: Int {
            actors.count
        }
        
        @Relationship(deleteRule: .cascade, inverse: \Review.movie)
        var reviews: [Review] = []
        @Relationship(deleteRule: .noAction, inverse: \Actor.movies)
        var actors: [Actor] = []
        
        init(title: String, year: Int) {
            self.title = title
            self.year = year
        }
    }
}

enum MoviesSchemaV2: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Movie.self]
    }
    
    static let versionIdentifier: Schema.Version = .init(0, 0, 1)
    
    @Model
    final class Movie {
        @Attribute(.unique) var title: String
        var year: Int
        
        var reviewCount: Int {
            reviews.count
        }
        
        var actorCount: Int {
            actors.count
        }
        
        @Relationship(deleteRule: .cascade, inverse: \Review.movie)
        var reviews: [Review] = []
        @Relationship(deleteRule: .noAction, inverse: \Actor.movies)
        var actors: [Actor] = []
        
        init(title: String, year: Int) {
            self.title = title
            self.year = year
        }
    }
}

enum MoviesSchemaV3: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Movie.self]
    }
    
    static let versionIdentifier: Schema.Version = .init(0, 0, 2)
    
    @Model
    final class Movie {
        @Attribute(.unique, originalName: "title") var name: String
        var year: Int
        
        var reviewCount: Int {
            reviews.count
        }
        
        var actorCount: Int {
            actors.count
        }
        
        @Relationship(deleteRule: .cascade, inverse: \Review.movie)
        var reviews: [Review] = []
        @Relationship(deleteRule: .noAction, inverse: \Actor.movies)
        var actors: [Actor] = []
        
        init(name: String, year: Int) {
            self.name = name
            self.year = year
        }
    }
}
