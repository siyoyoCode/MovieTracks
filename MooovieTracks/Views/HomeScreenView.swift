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
            Text("Trending Movies")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.all, 10)
                .foregroundColor(Color.deepPurple)
            
            MovieCarouselView(movieType: .trending)
            
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
