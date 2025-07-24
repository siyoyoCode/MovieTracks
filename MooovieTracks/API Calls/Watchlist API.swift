//
//  Watchlist API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/14/25.
//
import Foundation

func getWatchlist(accountID: Int, sessionID: String) async throws -> [MovieData] {
    guard let url = URL(string:"https://api.themoviedb.org/3/account/\(accountID)/watchlist/movies?api_key=\(apiKey)") else {
        throw APIError.invalidURL
    }
    
    //query components
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let queryItems = [URLQueryItem(name: "session_id", value: sessionID)]
    components.queryItems = queryItems

    //request
    var request = URLRequest(url: components.url!)
    request.httpMethod = "GET"
    request.addValue("Bearer \(apiAccessToken)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    //fetch data
    let (data, _) = try await URLSession.shared.data(for: request)
    
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MoviesResponseArray.self, from: data)
        
        //print statements
        for movie in response.results {
            print("""
                  WATCH LIST Title: \(movie.title)
                  Overview: \(movie.overview)
                  Backdrop Path: \(movie.poster_path)
                  ID: \(movie.id)
                  """)
        }
        
        return response.results
    } catch {
        throw APIError.decoderFailed
    }
}
