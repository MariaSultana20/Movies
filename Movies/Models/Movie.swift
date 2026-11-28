//
//  Movie.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import Foundation
import SwiftData

//typealias Movie = MoviesSchemaV3.Movie

@Model
final class Movie {
    @Attribute(.unique, originalName: "title") var name: String
    var year: Int
    var genre: Genre
    
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
    
    init(name: String, year: Int, genre: Genre) {
        self.name = name
        self.year = year
        self.genre = genre
    }
}
