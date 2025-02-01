//
//  WelcomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationStack { //needed to navigate between views
            ZStack {
                //set background color
                Color(hue: 0.696, saturation: 0.394, brightness: 0.34)
                    .ignoresSafeArea()

                VStack (spacing: 20){
                    
                    Text("Welcome to Mooovie Tracks!")
                        .font(.system(size: 36, weight: .black, design: .serif))
                        .bold()
                        .frame(width: 300, height: 150)
                        .multilineTextAlignment(.center)
                        
                    NavigationLink(destination: HomeScreenView()) {
                        Label("Continue as a guest!", systemImage: "person.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.brown)
                            .cornerRadius(10)
                    }
                    
                    
                    NavigationLink(destination: HomeScreenView()) {
                        Label("Sign in with Google!", systemImage: "globe")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.brown)
                            .cornerRadius(10)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures the content fills the screen
            } //z-stack
        } //nav stack
    }
}


#Preview {
    WelcomeScreenView()
}
