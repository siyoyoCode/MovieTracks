//
//  WelcomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//

import SwiftUI

struct WelcomeScreenView: View {
    @State var request_token: String = ""
    @State var authURL: URL? = nil
    @State var session_id: String = ""
    
    var callback: String = "mooovietracks://auth-success"
    
    var body: some View {
        
        NavigationStack { //needed to navigate between views
            ZStack {
                //set background color
                Color.deepPurple.ignoresSafeArea()

                VStack (spacing: 20){
                    
                    Text("Welcome to Mooovie Tracks!")
                        .font(.system(size: 36, weight: .black, design: .serif))
                        .bold()
                        .frame(width: 300, height: 150)
                        .multilineTextAlignment(.center)
                        
                    NavigationLink(destination: HomeScreenView()) {
                        Label("Continue as a guest!", systemImage: "movieclapper.fill")
                            .modifier(WelcomeScreenButtonStyle())
                    }
                    
                    //button for logging into tmdb
                    Button {
                        Task {
                            print("running button")
                            self.request_token = try await getRequestToken()
                            
                            //sets url
                            if let authURL = URL(string: "https://www.themoviedb.org/authenticate/\(request_token)?redirect_to=\(callback)") {
                                await UIApplication.shared.open(authURL)
                            }
                            
                        }
                    } label: {
                        Label("Login with TMDB!", systemImage: "person.fill")
                            .modifier(WelcomeScreenButtonStyle())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // ensures the content fills the screen
                .onOpenURL { url in
                    if url.scheme == "mooovietracks", url.host == "auth-success" {
                        print("redirect received from TMDB!")
                        Task {
                            print("doing task for onOpenURL)")
                            try? await session_id = getSessionID(request_token: request_token)
                        }
                    }
                }

            } //z-stack
        } //nav stack
    }
}


#Preview {
    WelcomeScreenView()
}
