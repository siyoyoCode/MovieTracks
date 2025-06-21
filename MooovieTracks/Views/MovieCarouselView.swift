//
//  MovieCard.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 5/26/25.
//

import SwiftUI

// configures view for a single movie
struct MovieCard: View {
    let movie: MovieData
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)"))
            { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .cornerRadius(10)
            .frame(width: 150, height: 200)
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                    .padding(.vertical, 10)

                Text(movie.overview)
                    .font(.caption)
                    .lineLimit(9)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 10)
        }
        .frame(width: UIScreen.main.bounds.width * 0.90) // responsive card width
        .padding(.all, 10)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
    }
}

struct MovieCarouselView: View {
    @State var moviesList: [MovieData] = []
    let movieType: MovieType
    
    var body: some View {
        TabView {
            ForEach(moviesList) {
                movies in MovieCard(movie: movies)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
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

private let sampleMovie = MovieData(
    title: "Inception",
    overview: "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious.",
    poster_path: "/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg",
    id: 42
)

#Preview {
    MovieCarouselView(movieType: .trending)
}
