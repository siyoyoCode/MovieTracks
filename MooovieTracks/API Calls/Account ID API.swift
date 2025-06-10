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
    //setting vars
    //let session_id = UserDefaults.standard.string(forKey: "sessionID")
    print("user session id")
    
    guard let url = URL(string: "https://api.themoviedb.org/3/account?api_key=\(apiKey)&session_id=\(sessionID)") else {
        print("stuck here 1")
        throw APIError.invalidURL
    }
    
    print(url)
    
    let (data, response) = try await URLSession.shared.data(from: url)
    print("Raw response: \(String(data: data, encoding: .utf8) ?? "no response")")
    print("stuck here 2")
    
    do {
        let decoder = JSONDecoder()
        print("stuck here 3")
        let response = try decoder.decode(accountData.self, from: data)
        print("stuck here 4")
        print("Account ID: \(response.id)")
        return response.id
    }
}

enum getAccountIDError {
    case invalidURL
}
