//
//  HomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        Text("aloha we are at home!!")
        
        HStack(spacing: 10){
            Text("Browse")
                .font(.system(size: 12, weight: .black, design: .serif))
                .bold()
                .frame(width: 100, height: 50)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .background(Color.brown)
                .cornerRadius(15)
            
            Text("Movie Lists")
                .font(.system(size: 12, weight: .black, design: .serif))
                .bold()
                .frame(width: 100, height: 50)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .background(Color.brown)
                .cornerRadius(15)
            
            Text("My Account")
                .font(.system(size: 12, weight: .black, design: .serif))
                .bold()
                .frame(width: 100, height: 50)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .background(Color.brown)
                .cornerRadius(15)
        }
    }
}

#Preview {
    HomeScreenView()
}
