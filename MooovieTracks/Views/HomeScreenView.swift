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
            
            Text("Movie Lists")
            
            Text("My Account")
        }
    }
}

#Preview {
    HomeScreenView()
}
