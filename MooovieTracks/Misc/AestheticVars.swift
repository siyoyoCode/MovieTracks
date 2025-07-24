//
//  AestheticVars.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 5/26/25.
//

import SwiftUI

//purple color
extension Color {
    static let deepPurple = Color(hue: 0.696, saturation: 0.394, brightness: 0.34)
}

//homescreen buttons
struct HomescreenButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .black, design: .serif))
            .bold()
            .frame(width: 100, height: 50)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .background(Color.deepPurple)
            .cornerRadius(15)
    }
}

//home screen heading
struct HomeScreenHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.all, 10)
            .foregroundColor(Color.deepPurple)
    }
}

//welcome screen buttons
struct WelcomeScreenButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.brown)
            .cornerRadius(10)
    }
}

//sample movie for previews
let sampleMovie1 = MovieData(
    title: "Inception",
    overview: "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious.",
    poster_path: "/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg",
    id: 42
)
