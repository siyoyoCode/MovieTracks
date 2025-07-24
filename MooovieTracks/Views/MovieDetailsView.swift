//
//  MovieDetailsView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/21/25.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieData

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
                    Label("Add to watchlist", systemImage: "person.fill")
                        .padding()
                        .background(.gray)
                        .cornerRadius(10)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9) //automatically configures to users width

    }
}

#Preview {
    MovieDetailsView(movie: sampleMovie1)
}
