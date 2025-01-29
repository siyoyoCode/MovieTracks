//
//  Movie Data.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/26/25.
//

import Foundation

let apiKey = "api key..."
let oldURL = "https://api.themoviedb.org/movie/1241982-moana-2"

//struct for a single movie
struct MovieData: Codable {
    
    let title: String
    let overview: String
    let backdrop_path: String
    
}

//reads the entire list of movies in JSON file
struct MovieResponse: Codable {
    let results: [MovieData]
}

func getMovies() async throws {
    let endpointURL = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)"
    
    guard let url = URL(string: endpointURL) else {
        throw getMoviesError.invalidURL
    }
    
    print("running in movies, got url")
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw getMoviesError.statusNotGood
    }
    
    print("running after httpsResponse")
    
    do {
        let decoder = JSONDecoder()
        let movieResponse = try decoder.decode(MovieResponse.self, from:data)
        
        print("moves incoming")
        
        for movie in movieResponse.results {
            print("""
                  Title: \(movie.title)
                  Overview: \(movie.overview)
                  Backdrop Path: \(movie.backdrop_path)
                  """)
        }
        
    } catch {
        throw getMoviesError.decoderFailed
    }
}

//possible errors to pass
enum getMoviesError: Error {
    case invalidURL
    case statusNotGood
    case decoderFailed
    case plsHelp
}

func plsRun() async throws {
    do {
        try await getMovies()
        print("running in plsRun")
    } catch {
        throw getMoviesError.plsHelp
    }
}




