//
//  MovieCardView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 7/24/25.
//

import SwiftUI

// configures view for a single movie
struct MovieCard: View {
    let movie: MovieData
    let onSelect: () -> Void //a fxn must be passed into MovieCard
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            moviePosterView(posterPath: movie.poster_path)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                    .padding(.vertical, 10)

                Text(movie.overview)
                    .font(.caption)
                    .lineLimit(9)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 10)
        }
        .frame(width: UIScreen.main.bounds.width * 0.85) // responsive card width
        .padding(.all, 10)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
        .onTapGesture{
            onSelect()
        }
    }
}

#Preview {
    MovieCard(movie: sampleMovie1, onSelect: {let a = 5})
}
