//
//  MovieCard.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 5/26/25.
//

import SwiftUI

struct MovieCard: View {
    let movie: MovieData
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)"))
            { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 250, height: 150)
            .clipped()
            .cornerRadius(10)
            
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
                .padding(.top, 4)

            Text(movie.overview)
                .font(.caption)
                .lineLimit(2)
                .foregroundColor(.secondary)
        }
    }
}

struct ContentView: View {
    @State var moviesList: [MovieData] = []

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(moviesList) {movies in
                    MovieCard(movie: movies)
                }
            }
            .padding()
        }
        .onAppear {
            Task {
                do {
                    // You should modify plsRun() to return [MovieData]
                    self.moviesList = try await getTrendingMovies()
                } catch {
                    print("Failed in getTrendingMovies: \(error)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
