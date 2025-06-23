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
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)"))
            { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray.opacity(0.3)
                Text("Image Loading!")
            }
            .frame(width: UIScreen.main.bounds.width * 0.45)
            .cornerRadius(15)
            
            VStack{
                Text(movie.title)
                    .font(.headline)
                    .padding(.vertical, 10)
                
                Text(movie.overview)
                    .font(.subheadline)
                    .padding(.bottom, 10)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9) //automatically configures to users width

    }
}

private let sampleMovie = MovieData(
    title: "Inception",
    overview: "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious.",
    poster_path: "/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg",
    id: 42
)

#Preview {
    MovieDetailsView(movie: sampleMovie)
}
