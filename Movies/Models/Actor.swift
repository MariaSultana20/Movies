//
//  Actor.swift
//  Movies
//
//  Created by Maria Sultana on 11/23/26.
//

import Foundation
import SwiftData

@Model
final class Actor {
    var name: String
    var movies: [Movie] = []
    
    init(name: String) {
        self.name = name
    }
}
