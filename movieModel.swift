//
//  movieModel.swift
//  testApp
//
//  Created by Sampel on 09/11/2023.
//

import Foundation

struct MovieModel:  Codable {

    // Movie model
    let id : Int
    let title: String
    let releaseDate: String
    let posterPath: String
    let overview: String
    let genreIds: [Int]

    
    enum CodingKeys : String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case overview
        case genreIds = "genre_ids"
    }
}

// MovieResponse model
struct MovieResponse: Codable {
    let results: [MovieModel]
}


