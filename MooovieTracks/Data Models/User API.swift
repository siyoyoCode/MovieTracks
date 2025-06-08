//
//  User API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/2/25.
//
import Foundation

struct userData: Codable {
    let id: Int?
    let sessionId: String?
    let name: String?
    let username: String?
}

struct authData: Codable {
    let request_token: String
}

func getRequestToken() async throws -> String {
    let requestTokenUrl = "https://api.themoviedb.org/3/authentication/token/new?api_key=\(apiKey)"
    
    guard let url = URL(string: requestTokenUrl) else {
        throw authUserError.invalidURL
    }
    
    //fetch data
    let (data, _) = try await URLSession.shared.data(from: url)
    
    do {
        //decode data
        let decoder = JSONDecoder()
        let authUserResponse = try decoder.decode(authData.self, from: data)
        
        print("request_token: \(authUserResponse.request_token)")
        
        //returns request token
        return authUserResponse.request_token
    } catch {
        throw authUserError.decoderFailed
    }
}

func getSessionID() async throws -> String {
    
    let request_token = try await getRequestToken()
    let startSessionURL = "https://api.themoviedb.org/3/authentication/session/new"
    
    let parameters = ["request_token": request_token] as [String : Any?]
    
    let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
    
    let url = URL(string: startSessionURL)!
    var request = URLRequest(url: url)
    request.httpBody = postData //the data that is sent as part of the API call
    
    //recieve data
    let (data, response) = try await URLSession.shared.data(from: url)
    
    return "hello, TODO: fix"

}

enum authUserError: Error {
    case invalidURL
    case statusNotGood
    case decoderFailed
}
