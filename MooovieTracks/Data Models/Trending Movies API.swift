//
//  Trending Movies API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/2/25.
//

import Foundation

//struct for a single movie
struct MovieData: Codable, Identifiable {
    
    let title: String
    let overview: String
    let poster_path: String
    let id: Int
    
}

//reads the entire list of movies in JSON file
struct trendingMoviesResponse: Codable {
    let results: [MovieData]
}

//runs an API request to get a list of trending movies
func getTrendingMovies() async throws -> [MovieData] {
    let endpointURL = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)"
    
    guard let url = URL(string: endpointURL) else {
        throw getMoviesError.invalidURL
    }
    
    print("running in movies, got url")
    
    //fetches data
    let (data, response) = try await URLSession.shared.data(from: url)
    
    //checks status
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw getMoviesError.statusNotGood
    }
    
    print("running after httpsResponse")
    
    //decodes data into acceptable format
    do {
        let decoder = JSONDecoder()
        let movieResponse = try decoder.decode(trendingMoviesResponse.self, from:data)
        
        print("movies incoming")
        for movie in movieResponse.results {
            print("""
                  Title: \(movie.title)
                  Overview: \(movie.overview)
                  Backdrop Path: \(movie.poster_path)
                  ID: \(movie.id)
                  """)
        }
        
        return movieResponse.results
        
    } catch {
        throw getMoviesError.decoderFailed
    }
}

//possible errors to pass
enum getMoviesError: Error {
    case invalidURL
    case statusNotGood
    case decoderFailed
}
