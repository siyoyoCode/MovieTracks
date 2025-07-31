//
//  MovieDetailsView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/21/25.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieData
    let userScreenWidth: Double = UIScreen.main.bounds.width

    var body: some View {
        
        VStack{
            moviePosterView(posterPath: movie.poster_path)
            
            VStack{
                Text(movie.title)
                    .font(.headline)
                    .padding(.vertical, 10)
                
                Text(movie.overview)
                    .font(.subheadline)
                    .padding(.bottom, 10)
            }
            
            HStack{
                Button {print("Adding to watchlist?")} label: {
                    Label("Add to watchlist", systemImage: "plus.circle")
                        .modifier(MovieDetailsButtonStyle(userScreenWidth: userScreenWidth, buttonHeight: 50))
                }
                
                Button {print("Already Watched")} label: {
                    Label("Already Watched", systemImage: "movieclapper")
                        .modifier(MovieDetailsButtonStyle(userScreenWidth: userScreenWidth, buttonHeight: 50))
                        .symbolEffect(.bounce.up.wholeSymbol, options: .nonRepeating)
                }
            }
        }
        .frame(width: userScreenWidth * 0.9) //automatically configures to users width

    }
}

#Preview {
    MovieDetailsView(movie: sampleMovie1)
}

