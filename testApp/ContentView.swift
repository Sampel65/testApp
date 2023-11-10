//
//  ContentView.swift
//  testApp
//
//  Created by Sampel on 09/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MovieListViewModel()
    var body: some View {
        MovieListView(viewModel: viewModel)
            .onAppear {
                viewModel.fetchData()
                        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
