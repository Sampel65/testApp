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
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w300\(movie.posterPath)")) { phase in
                    switch phase {
                    case .empty:
                        Text("Loading...")
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame( height: 300)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 7)
                            )
                    case .failure:
                        Text("Failed to load image")
                    @unknown default:
                        Text("Unknown state")
                    }
                }
                
                Text(movie.title)
                    .font(.subheadline)
                    .padding()
                
                Text("Release Date: \(movie.releaseDate)")
                    .foregroundColor(.gray)
                
                // Display genre information
                Text("Genres: \(genreNames(for: movie.genreIds))")
                    .foregroundColor(.gray)
 
                
                Text(movie.overview)
                    .padding()
                    .multilineTextAlignment(.center)
                

                Spacer()
            }
            .padding()
        }
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

