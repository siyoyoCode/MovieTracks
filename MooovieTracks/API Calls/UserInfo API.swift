//
//  Account ID API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/9/25.
//

import SwiftUI

struct accountData: Codable {
    let id: Int
    //let username: String
}

func getAccountID(sessionID: String) async throws -> Int {
    
    guard let url = URL(string: "https://api.themoviedb.org/3/account?api_key=\(apiKey)&session_id=\(sessionID)") else {
        throw APIError.invalidURL
    }
    
    print(url)
    
    let (data, _) = try await URLSession.shared.data(from: url)
    print("Raw response: \(String(data: data, encoding: .utf8) ?? "no response")")
    
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(accountData.self, from: data)
        print("Account ID: \(response.id)")
        return response.id
    }
}
