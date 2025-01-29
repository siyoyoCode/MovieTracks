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

                VStack {
                    NavigationLink(destination: HomeScreenView()) {
                        Label("click here to go to home", systemImage: "globe")
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
