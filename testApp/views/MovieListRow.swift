//
//  MovieListRow.swift
//  testApp
//
//  Created by Sampel on 09/11/2023.
//

import SwiftUI

struct MovieListRow: View {
    var movie: MovieModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\(movie.posterPath)")) { phase in
                switch phase {
                case .empty:
                    Text("Loading...")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 75)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    Text("Unknown state")
                }
            }

            VStack(alignment: .leading) {
                Text(movie.title)
                Text("Release Date: \(movie.releaseDate)")
                    .font(.caption)
                    .foregroundColor(.gray)

            }
        }
        .padding(8)
    }
}


struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(movie: MovieModel(id: 1, title: "the poster", releaseDate: "12", posterPath: "yNySAgpAnWmPpYinim9E0tUzJWG.jpg", overview: "ertyuiodfghjk", genreIds: [60, 40]))
    }
}
