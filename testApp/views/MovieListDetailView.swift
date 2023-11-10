//
//  MovieListDetailView.swift
//  testApp
//
//  Created by Sampel on 09/11/2023.
//

import SwiftUI

struct MovieListDetailView: View {
    var movie: MovieModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w300\(movie.posterPath)")) { phase in
                switch phase {
                case .empty:
                    Text("Loading...")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    Text("Unknown state")
                }
            }
            
            Text(movie.title)
                .font(.title)
                .padding()
            
            Text("Release Date: \(movie.releaseDate)")
                .foregroundColor(.gray)
                .padding()
            
            Text(movie.overview)
                .padding()
            
            // Display genre information
            Text("Genres: \(genreNames(for: movie.genreIds))")
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle(movie.title)
    }
    
    private func genreNames(for genreIds: [Int]) -> String {
        
        let genreMapping: [Int: String] = [
            16: "Animation",
            10751: "Family",
            28: "Action",
            878: "Science Fiction"
        ]
        
        let genreNames = genreIds.compactMap { genreMapping[$0] }
        return genreNames.joined(separator: ", ")
    }
}

