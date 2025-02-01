import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/siyoyodh/Coding/MooovieTracks/MooovieTracks/Views/HomeScreenView.swift", line: 1)
//
//  HomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        Text(__designTimeString("#8717_0", fallback: "aloha we are at home!!"))
        
        HStack(spacing: __designTimeInteger("#8717_1", fallback: 10)){
            Text(__designTimeString("#8717_2", fallback: "Browse"))
            
            Text(__designTimeString("#8717_3", fallback: "Movie Lists"))
            
            Text(__designTimeString("#8717_4", fallback: "My Account"))
        }
    }
}

#Preview {
    HomeScreenView()
}
