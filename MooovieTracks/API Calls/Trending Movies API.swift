//
//  Trending Movies API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/2/25.
//

import Foundation

//reads the entire list of movies in JSON file
struct MoviesResponseArray: Codable {
    let results: [MovieData]
}

//runs an API request to get a list of trending movies
func getTrendingMovies() async throws -> [MovieData] {
    let endpointURL = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)"
    
    guard let url = URL(string: endpointURL) else {
        throw APIError.invalidURL
    }
    
    print("running in movies, got url")
    
    //fetches data
    let (data, response) = try await URLSession.shared.data(from: url)
    
    //checks status
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw APIError.statusNotGood
    }
    
    print("running after httpsResponse")
    
    //decodes data into acceptable format
    do {
        let decoder = JSONDecoder()
        let movieResponse = try decoder.decode(MoviesResponseArray.self, from:data)
        
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
        print("Decoding error:", error)
        throw APIError.decoderFailed
    }
}

