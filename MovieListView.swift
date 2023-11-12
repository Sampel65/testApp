//
//  MovieListView.swift
//  testApp
//
//  Created by Sampel on 09/11/2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    @State private var isAnimated = false

    var body: some View {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                    ForEach(viewModel.movies, id: \.title) { movie in
                        NavigationLink(destination: MovieListDetailView(movie: movie)) {
                            VStack(spacing: 5) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\(movie.posterPath)")) { phase in
                                    switch phase {
                                    case .empty:
                                        Text("Loading...")
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 150)
                                            .cornerRadius(10)
                                            .clipped()
                                            .padding(.top, 8)
                                    case .failure:
                                        Text("Failed to load image")
                                            .foregroundColor(.red)
                                    @unknown default:
                                        Text("Unknown state")
                                            .foregroundColor(.red)
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 150)

                                Text(movie.title)
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .padding([.leading, .trailing], 8)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 5)
                            .background(Color.black)
                            .cornerRadius(10)
                            .opacity(isAnimated ? 1 : 0)
                            .animation(.easeInOut(duration: 0.5))
                        }
                    }
                }
                .padding(16)
                .onAppear {
                    withAnimation {
                        isAnimated = true
                        viewModel.fetchData()
                    }
                }

    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
