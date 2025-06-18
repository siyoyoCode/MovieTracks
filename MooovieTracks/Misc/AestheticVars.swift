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

struct HomeScreenHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.all, 10)
            .foregroundColor(Color.deepPurple)
    }
}

