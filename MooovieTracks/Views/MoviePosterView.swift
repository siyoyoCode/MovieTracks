//
//  MoviePosterView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 7/24/25.
//

import SwiftUICore
import SwiftUI

func moviePosterView(posterPath: String?) -> some View {
    Group {
        if let posterPath = posterPath {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .cornerRadius(10)
            .frame(width: 150, height: 200)
            .padding(.vertical, 10)
        } else {
            ZStack {
                Color.gray
                    .frame(width: 150, height: 250)
                    .cornerRadius(10)

                Text("Movie Image Unavailable")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}
