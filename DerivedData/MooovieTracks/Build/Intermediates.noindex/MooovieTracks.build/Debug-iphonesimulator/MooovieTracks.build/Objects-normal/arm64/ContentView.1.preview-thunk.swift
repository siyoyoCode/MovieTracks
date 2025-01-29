import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/siyoyodh/Coding/MooovieTracks/MooovieTracks/ContentView.swift", line: 1)
//
//  ContentView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            WelcomeScreenView()
        }
        .background(Color(hue: __designTimeFloat("#7070_0", fallback: 0.696), saturation: __designTimeFloat("#7070_1", fallback: 0.394), brightness: __designTimeFloat("#7070_2", fallback: 0.34)))
        
//        Text("Fetching movies...")
//                    .onAppear {
//                        Task {
//                            print("before PlsRun")
//                            try await plsRun()
//                        }
//                    }
    }
}

#Preview {
    ContentView()
}
