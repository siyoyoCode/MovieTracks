//
//  MovieCard.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 5/26/25.
//

import SwiftUI

struct MovieCarouselView: View {
    @State var moviesList: [MovieData] = []
    @State var selectedMovie: MovieData? = nil
    let movieType: MovieType
    
    var body: some View {
        NavigationStack{
            TabView {
                ForEach(moviesList) {
                    movie in MovieCard(movie: movie, onSelect: {selectedMovie = movie})
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .navigationDestination(item: $selectedMovie) {
                movie in MovieDetailsView(movie: movie)
            }
        }
        .onAppear {
            Task {
                switch movieType {
                    case .watchlist:
                    self.moviesList = try await getWatchlist(accountID: UserDefaults.standard.integer(forKey: "accountID"), sessionID: UserDefaults.standard.string(forKey: "sessionID")!)
                    case .trending:
                        self.moviesList = try await getTrendingMovies()
                    case .continueWatching:
                        self.moviesList = try await getTrendingMovies() //FIX
                }
            }
        }
    }
}

enum MovieType {
    case trending
    case watchlist
    case continueWatching
}

#Preview {
    MovieCarouselView(movieType: .trending)
}
