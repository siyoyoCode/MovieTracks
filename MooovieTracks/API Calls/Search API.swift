//
//  Search API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 7/17/25.
//
import Foundation

func searchDatabase(userQuery: String) async throws -> [MovieData] {
    guard let url = URL(string: "https://api.themoviedb.org/3/search/movie") else {
        throw APIError.invalidURL
    }
    
    //query components
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let query = [URLQueryItem(name: "query", value: userQuery)]
    components.queryItems = query
    
    //request
    var request = URLRequest(url: components.url!)
    request.httpMethod = "GET"
    request.addValue("Bearer \(apiAccessToken)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    //fetch request
    let (data, _) = try await URLSession.shared.data(for: request)

    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MoviesResponseArray.self, from: data)
        
        return response.results
        
    } catch {
        throw APIError.statusNotGood
    }
    
}
