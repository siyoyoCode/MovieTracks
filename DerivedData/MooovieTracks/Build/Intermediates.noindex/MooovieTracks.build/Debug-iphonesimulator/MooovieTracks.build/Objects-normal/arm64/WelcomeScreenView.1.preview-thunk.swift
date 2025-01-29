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
                Color(hue: __designTimeFloat("#8734_0", fallback: 0.696), saturation: __designTimeFloat("#8734_1", fallback: 0.394), brightness: __designTimeFloat("#8734_2", fallback: 0.34))
                    .ignoresSafeArea()

                VStack {
                    NavigationLink(destination: HomeScreenView()) {
                        Label(__designTimeString("#8734_3", fallback: "click here to go to home"), systemImage: __designTimeString("#8734_4", fallback: "globe"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: __designTimeInteger("#8734_5", fallback: 300), height: __designTimeInteger("#8734_6", fallback: 50))
                            .background(Color.brown)
                            .cornerRadius(__designTimeInteger("#8734_7", fallback: 10))
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
