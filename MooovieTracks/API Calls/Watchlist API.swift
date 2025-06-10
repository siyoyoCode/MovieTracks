//
//  Watchlist API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/2/25.
//

import Foundation

struct userWatchListResponse: Codable {
    let results: [MovieData]
}

//def function getUserWatchList() {
//    let endpointURL = "https://api.themoviedb.org/3/account?api_key=\(apiKey)&session_id=xxxxxxxxxxx"
//}

//func getWatchList() async throws -> [MovieData] {
//    
//}
