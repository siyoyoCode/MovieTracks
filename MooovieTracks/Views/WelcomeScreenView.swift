//
//  WelcomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//

import SwiftUI

struct WelcomeScreenView: View {
    @State var request_token: String = ""
    @State private var authURL: URL? = nil

    
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
                    
//                    NavigationLink(destination: url) {
//                        Label("Login with TMDB!", systemImage: "globe")
//                            .modifier(HomescreenButtonStyle())
//                            .onTapGesture {
//                                Task {
//                                    let request_token = try await getRequestToken()
//                                }
//                            }
//                    }
                    
                    //button for logging into tmdb
                    Button {
                        Task {
                            self.request_token = try await getRequestToken()
                            if let url = URL(string: "https://www.themoviedb.org/authenticate/\(request_token)") {
                                authURL = url
                                await UIApplication.shared.open(url)
                            }
                        }
                    } label: {
                        Label("Login with TMDB!", systemImage: "person.fill")
                            .modifier(WelcomeScreenButtonStyle())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // ensures the content fills the screen
            } //z-stack
        } //nav stack
    }
}


#Preview {
    WelcomeScreenView()
}
