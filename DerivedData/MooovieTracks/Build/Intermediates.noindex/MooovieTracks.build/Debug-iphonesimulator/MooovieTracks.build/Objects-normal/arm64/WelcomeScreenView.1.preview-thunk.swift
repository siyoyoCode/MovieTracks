import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/siyoyodh/Coding/MooovieTracks/MooovieTracks/Views/WelcomeScreenView.swift", line: 1)
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
                Color(hue: __designTimeFloat("#8715_0", fallback: 0.696), saturation: __designTimeFloat("#8715_1", fallback: 0.394), brightness: __designTimeFloat("#8715_2", fallback: 0.34))
                    .ignoresSafeArea()

                VStack (spacing: __designTimeInteger("#8715_3", fallback: 20)){
                    
                    Text(__designTimeString("#8715_4", fallback: "Welcome to Mooovie Tracks!"))
                        .font(.system(size: __designTimeInteger("#8715_5", fallback: 36), weight: .black, design: .serif))
                        .bold()
                        .frame(width: __designTimeInteger("#8715_6", fallback: 300), height: __designTimeInteger("#8715_7", fallback: 150))
                        .multilineTextAlignment(.center)
                        
                    NavigationLink(destination: HomeScreenView()) {
                        Label(__designTimeString("#8715_8", fallback: "Continue as a guest!"), systemImage: __designTimeString("#8715_9", fallback: "person.fill"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: __designTimeInteger("#8715_10", fallback: 300), height: __designTimeInteger("#8715_11", fallback: 50))
                            .background(Color.brown)
                            .cornerRadius(__designTimeInteger("#8715_12", fallback: 10))
                    }
                    
                    
                    NavigationLink(destination: HomeScreenView()) {
                        Label(__designTimeString("#8715_13", fallback: "Sign in with Google!"), systemImage: __designTimeString("#8715_14", fallback: "globe"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: __designTimeInteger("#8715_15", fallback: 300), height: __designTimeInteger("#8715_16", fallback: 50))
                            .background(Color.brown)
                            .cornerRadius(__designTimeInteger("#8715_17", fallback: 10))
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
