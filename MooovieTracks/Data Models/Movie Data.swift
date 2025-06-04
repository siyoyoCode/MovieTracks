//
//  Movie Data.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/26/25.
//

//import Foundation
//
////load api key
//func getAPIKey() -> String {
//    if let path = Bundle.main.path(forResource: "keys", ofType: "plist"),
//       let dict = NSDictionary(contentsOfFile: path),
//       let apiKey = dict["API_KEY"] as? String {
//        return apiKey
//    } else {
//        print("API KEY ERROR")
//        return "error"
//    }
//}

//TODO: find how to hide api key
let apiKey = "f6e0e4a047c413e13c5eb052955ddcf6" //getAPIKey()

//struct for a single movie
struct MovieData: Codable, Identifiable {
    
    let title: String
    let overview: String
    let poster_path: String
    let id: Int
    
}

//func fetchMovies() async throws {
//    do {
//        try await getTrendingMovies()
//        print("running in plsRun")
//    } catch {
//        throw getMoviesError.plsHelp
//    }
//}





