//
//  Genra.swift
//  Movies
//
//  Created by Maria Sultana on 11/27/26.
//

enum Genre: Int, Codable, CaseIterable, Identifiable {
    case action = 1
    case scifi
    case fiction
    case horror
    case romance
    case thriller

    var id: Int { rawValue }
}

extension Genre {
    var name: String {
        switch self {
        case .action: return "Action"
        case .scifi: return "Scifi"
        case .fiction: return "Fiction"
        case .horror: return "Horror"
        case .romance: return "Romance"
        case .thriller : return "Thriller"
        }
    }
}
