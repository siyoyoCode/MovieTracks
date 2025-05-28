//
//  HomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            ScrollTrendableMoviesView()
            
            HStack(spacing: 10){
                Text("Browse")
                    .modifier(HomescreenButtonStyle())
                
                Text("Movie Lists")
                    .modifier(HomescreenButtonStyle())
                
                Text("My Account")
                    .modifier(HomescreenButtonStyle())
            }
        }
    }
}


#Preview {
    HomeScreenView()
}
