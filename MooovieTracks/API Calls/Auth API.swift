//
//  User API.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/2/25.
//
import Foundation
import SwiftUI

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
        let response = try decoder.decode(requestTokenData.self, from: data)
        
        print("request_token: \(response.request_token)")
        
        //returns request token
        return response.request_token
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
        let response = try decoder.decode(sessionData.self, from: data)
        
        print("session id: \(response.session_id)")
        
        return response.session_id
    }
}

class UserSession: ObservableObject {
    @Published var sessionID: String
    @Published var accountID: Int
    @Published var isAuthenticated: Bool = false
    
    var requestToken: String = ""
    var callback: String = "mooovietracks://auth-success"
    
    init() {
        self.sessionID = UserDefaults.standard.string(forKey: "sessionID") ?? ""
        self.accountID = UserDefaults.standard.integer(forKey: "accountID")
        self.isAuthenticated = false
    }
    
    func initializeLogIn() async throws {
        
        do {
            self.requestToken = try await getRequestToken()
            UserDefaults.standard.set(requestToken, forKey: "requestToken")
        } catch {
            throw authUserError.failedAPI
        }
        
        if let authURL = URL(string: "https://www.themoviedb.org/authenticate/\(self.requestToken)?redirect_to=\(callback)") {
            DispatchQueue.main.async {
                UIApplication.shared.open(authURL)
            }
        } else {
            throw authUserError.invalidURL
        }
        
    }
    
    func logIn() async throws {
        
        do {
            let currentsessionID = try await getSessionID(request_token: self.requestToken)
            let currentaccountID = try await getAccountID(sessionID: currentsessionID)
            
            DispatchQueue.main.async{
                self.sessionID = currentsessionID
                self.accountID = currentaccountID

                UserDefaults.standard.set(self.sessionID, forKey: "sessionID")
                UserDefaults.standard.set(self.accountID, forKey: "accountID")
                self.isAuthenticated = true

            }
        } catch {
            throw authUserError.failedAPI
        }
        
    }
    
    func logOut() {
        UserDefaults.standard.removeObject(forKey: "sessionID")
        UserDefaults.standard.removeObject(forKey: "accountID")
        self.isAuthenticated = false
    }
    
}

enum authUserError: Error {
    case invalidURL
    case failedAPI
}
