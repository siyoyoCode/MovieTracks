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
            Image(systemName: __designTimeString("#7012_0", fallback: "globe"))
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(__designTimeString("#7012_1", fallback: "Please let git work"))
        }
        .padding()
        
        Text(__designTimeString("#7012_2", fallback: "Fetching movies..."))
                    .onAppear {
                        Task {
                            try await plsRun()
                        }
                    }
    }
}

#Preview {
    ContentView()
}
