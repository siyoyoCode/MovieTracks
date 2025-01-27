//
//  Movie Data.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/26/25.
//

import Foundation

let apiKey = "f6e0e4a047c413e13c5eb052955ddcf6"
let oldURL = "https://api.themoviedb.org/3/discover/movie"

struct MovieData: Codable {
    
    let title: String
    let overview: String
    let backdrop_path: String
    
}

func getMovies() async throws -> MovieData {
    let endpointURL = "https://api.themoviedb.org/movie/1241982-moana-2?api_key=\(apiKey)"
    
    guard let url = URL(string: endpointURL) else {
        throw getMoviesError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw getMoviesError.statusNotGood
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(MovieData.self, from:data)
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
        let movies = try await getMovies()
        print(movies)
    } catch {
        throw getMoviesError.plsHelp
    }
}




