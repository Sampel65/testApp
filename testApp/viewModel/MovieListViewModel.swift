//
//  MovieListViewModel.swift
//  testApp
//
//  Created by Sampel on 09/11/2023.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieModel] = []

    func fetchData() {
        let apiKey = "c0e0a94c792e260b9a99d191f944acdd"
        let apiUrl = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=\(apiKey)")!

        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    self.movies = jsonData.results
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
