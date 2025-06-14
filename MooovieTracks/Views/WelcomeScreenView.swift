//
//  WelcomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//

import SwiftUI

struct WelcomeScreenView: View {
    @EnvironmentObject var userSession: UserSession
        
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
                             try await userSession.initializeLogIn()
                        }
                        
                    } label: {
                        Label("Login with TMDB!", systemImage: "person.fill")
                            .modifier(WelcomeScreenButtonStyle())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // ensures the content fills the screen
                .onOpenURL { url in
                    if url.scheme == "mooovietracks", url.host == "auth-success" {
                        Task {
                            try await userSession.logIn()
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
