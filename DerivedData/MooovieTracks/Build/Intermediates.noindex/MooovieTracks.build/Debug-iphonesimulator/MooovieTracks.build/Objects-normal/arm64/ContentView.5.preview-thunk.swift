import func SwiftUI.__designTimeSelection

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
        __designTimeSelection(VStack {
            __designTimeSelection(Image(systemName: __designTimeString("#7012_0", fallback: "globe"))
                .imageScale(.large)
                .foregroundStyle(.tint), "#7012.[1].[0].property.[0].[0].arg[0].value.[0]")
            __designTimeSelection(Text(__designTimeString("#7012_1", fallback: "Please let git work")), "#7012.[1].[0].property.[0].[0].arg[0].value.[1]")
        }
        .padding(), "#7012.[1].[0].property.[0].[0]")
    }
}

#Preview {
    ContentView()
}
