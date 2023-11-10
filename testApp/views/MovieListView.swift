//
//  MovieListView.swift
//  testApp
//
//  Created by Sampel on 09/11/2023.
//

import SwiftUI

struct MovieListView: View {

    @ObservedObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.title) { movie in
                NavigationLink(destination: MovieListDetailView(movie: movie)) {
                    MovieListRow(movie: movie)
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
            .navigationTitle("Movie List")
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
