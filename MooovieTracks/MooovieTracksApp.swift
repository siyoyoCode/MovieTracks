//
//  MooovieTracksApp.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/26/25.
//

import SwiftUI

@main
struct MooovieTracksApp: App {
    @StateObject var userSession = UserSession()
    
    var body: some Scene {
        WindowGroup {
            WelcomeScreenView()
                .environmentObject(userSession)
        }
    }
}
