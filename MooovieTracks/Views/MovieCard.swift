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

struct ScrollTrendableMoviesView: View {
    @State var moviesList: [MovieData] = []
    @State var request_token: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Trending Movies")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.all, 10)
                .foregroundColor(Color.deepPurple)
            
            TabView {
                ForEach(moviesList) {movies in
                    MovieCard(movie: movies)}
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
        .onAppear {
            Task {
                do {
                    self.moviesList = try await getTrendingMovies()
                } catch {
                    print("Failed in getTrendingMovies: \(error)")
                }
                
                do {
                    self.request_token = try await
                        authenticateUser()
                } catch {
                    print("failed to auth user:\(error)")
                }
            }
        }
    }
}

let exampleMovie = MovieData(
    title: "Inception",
    overview: "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious.",
    poster_path: "/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg",
    id: 42
)

#Preview {
    ScrollTrendableMoviesView()
}
