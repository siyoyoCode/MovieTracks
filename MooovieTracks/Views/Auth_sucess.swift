//
//  Auth_sucess.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 6/8/25.
//

import SwiftUI

struct Auth_sucess: View {
    
    var body: some View {
        WelcomeScreenView()
            .onOpenURL { url in
            if url.scheme == "moovietracks", url.host == "auth-success" {
                        Task {
                            do {
                                print("redirect sucess!")
                            }
                        }
                    }
                }
    }
}
