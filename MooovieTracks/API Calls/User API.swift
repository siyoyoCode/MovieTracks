//
//  User API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/2/25.
//
import Foundation

struct userData: Codable {
    let id: Int?
    let name: String?
    let username: String?
}

struct requestTokenData: Codable {
    let request_token: String
}

struct sessionData: Codable {
    let session_id: String
}

func getRequestToken() async throws -> String {
    let requestTokenUrl = "https://api.themoviedb.org/3/authentication/token/new?api_key=\(apiKey)"
    
    guard let url = URL(string: requestTokenUrl) else {
        throw APIError.invalidURL
    }
    
    //fetch data
    let (data, _) = try await URLSession.shared.data(from: url)
    
    do {
        //decode data
        let decoder = JSONDecoder()
        let authUserResponse = try decoder.decode(requestTokenData.self, from: data)
        
        print("request_token: \(authUserResponse.request_token)")
        
        //returns request token
        return authUserResponse.request_token
    } catch {
        throw APIError.decoderFailed
    }
}

func getSessionID(request_token: String) async throws -> String {
    
    //variables
    let startSessionURL = "https://api.themoviedb.org/3/authentication/session/new"
    let url = URL(string: startSessionURL)!
    let parameters = ["request_token": request_token] as [String : Any?]
    
    //API vars
    let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
    print("postdata: \(postData)")
    var request = URLRequest(url: url)
    
    //data that is sent to tmdb as part of  API call
    request.httpBody = postData
    request.httpMethod = "POST"
    request.addValue("Bearer \(apiAccessToken)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    //recieve data
    let (data, _) = try await URLSession.shared.data(for: request)
    
    //decode data
    do {
        let decoder = JSONDecoder()
        let authUserResponse = try decoder.decode(sessionData.self, from: data)
        
        print("session id: \(authUserResponse.session_id)")
        
        return authUserResponse.session_id
    }
}
