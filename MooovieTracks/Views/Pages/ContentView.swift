//
//  ContentView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/14/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        if userSession.isAuthenticated {
            HomeScreenView()
        } else {
            WelcomeScreenView()
                .environmentObject(userSession)
        }
    }
}
