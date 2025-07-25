//
//  MovieScrollerView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 7/23/25.
//
import SwiftUI

struct MovieScrollerView: View {
    let movieSearchResults: [MovieData]
    @State private var selectedMovie: MovieData?
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(movieSearchResults) {
                    movie in MovieCard(movie: movie, onSelect: {selectedMovie = movie})
                }
            }
            .navigationDestination(item: $selectedMovie) {
                movie in MovieDetailsView(movie: movie)
            }
        }
    }
}

private let sampleMovieSearch = [sampleMovie1, sampleMovie1, sampleMovie1, sampleMovie1]

#Preview {
    MovieScrollerView(movieSearchResults: sampleMovieSearch)
}
