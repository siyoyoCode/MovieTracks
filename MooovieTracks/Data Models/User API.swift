//
//  User API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/2/25.
//
import Foundation

struct userData: Codable {
    let id: Int
    let sessionId: String?
    let name: String
    let username: String
}

struct authData: Codable {
    let request_token: String
}

func authenticateUser() async throws -> String {
    let requestTokenUrl = "https://api.themoviedb.org/3/authentication/token/new?api_key=\(apiKey)"
    
    guard let url = URL(string: requestTokenUrl) else {
        throw authUserError.invalidURL
    }
    
    //fetch data
    let (data, response) = try await URLSession.shared.data(from: url)
    
    //checks status
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw authUserError.statusNotGood
    }
    
    do {
        //decode data
        let decoder = JSONDecoder()
        let authUserResponse = try decoder.decode(authData.self, from: data)
        
        print(authUserResponse.request_token)
        
        //returns request token
        return authUserResponse.request_token
    } catch {
        throw authUserError.decoderFailed
    }
    
}

enum authUserError: Error {
    case invalidURL
    case statusNotGood
    case decoderFailed
}

