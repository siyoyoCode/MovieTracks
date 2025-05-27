//
//  Movie Data.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/26/25.
//

import Foundation

//load api key
func getAPIKey() -> String {
    if let path = Bundle.main.path(forResource: "keys", ofType: "plist"),
       let dict = NSDictionary(contentsOfFile: path),
       let apiKey = dict["API_KEY"] as? String {
        return apiKey
    } else {
        print("API KEY ERROR")
        return "error"
    }
}

//TODO: find how to hide api key
let apiKey = "f6e0e4a047c413e13c5eb052955ddcf6" //getAPIKey()

//struct for a single movie
struct MovieData: Codable, Identifiable {
    
    let title: String
    let overview: String
    let startDate: Date?
    let endDate: Date?
    let poster_path: String
    let id: Int
    
}

//reads the entire list of movies in JSON file
struct MovieResponse: Codable {
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
        let movieResponse = try decoder.decode(MovieResponse.self, from:data)
        
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
    case APINotFound
}

//func fetchMovies() async throws {
//    do {
//        try await getTrendingMovies()
//        print("running in plsRun")
//    } catch {
//        throw getMoviesError.plsHelp
//    }
//}





