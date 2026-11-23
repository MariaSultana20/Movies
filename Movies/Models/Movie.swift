//
//  Movie.swift
//  Movies
//
//  Created by Maria Sultana on 11/20/26.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    
    @Relationship(deleteRule: .cascade, inverse: \Review.movie)
    var reviews: [Review]? = []
    @Relationship(deleteRule: .noAction, inverse: \Actor.movies)
    var actors: [Actor] = []
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}
