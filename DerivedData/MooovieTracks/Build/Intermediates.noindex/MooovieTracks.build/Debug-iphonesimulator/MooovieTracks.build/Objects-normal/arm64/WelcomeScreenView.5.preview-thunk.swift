import func SwiftUI.__designTimeSelection

import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/siyoyodh/Coding/MooovieTracks/MooovieTracks/Views/WelcomeScreenView.swift", line: 1)
//
//  WelcomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        __designTimeSelection(NavigationStack { //needed to navigate between views
            __designTimeSelection(ZStack {
                //set background color
                __designTimeSelection(Color(hue: __designTimeFloat("#4537_0", fallback: 0.696), saturation: __designTimeFloat("#4537_1", fallback: 0.394), brightness: __designTimeFloat("#4537_2", fallback: 0.34))
                    .ignoresSafeArea(), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")

                __designTimeSelection(VStack (spacing: __designTimeInteger("#4537_3", fallback: 20)){
                    
                    __designTimeSelection(Text(__designTimeString("#4537_4", fallback: "Welcome to Mooovie Tracks!"))
                        .font(__designTimeSelection(.system(size: __designTimeInteger("#4537_5", fallback: 36), weight: .black, design: .serif), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[0]"))
                        .bold()
                        .frame(width: __designTimeInteger("#4537_6", fallback: 300), height: __designTimeInteger("#4537_7", fallback: 150))
                        .multilineTextAlignment(.center), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0]")
                        
                    __designTimeSelection(NavigationLink(destination: __designTimeSelection(HomeScreenView(), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].arg[0].value")) {
                        __designTimeSelection(Label(__designTimeString("#4537_8", fallback: "Continue as a guest!"), systemImage: __designTimeString("#4537_9", fallback: "person.fill"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: __designTimeInteger("#4537_10", fallback: 300), height: __designTimeInteger("#4537_11", fallback: 50))
                            .background(__designTimeSelection(Color.brown, "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].arg[1].value.[0].modifier[3].arg[0].value"))
                            .cornerRadius(__designTimeInteger("#4537_12", fallback: 10)), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1].arg[1].value.[0]")
                    }, "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[1]")
                    
                    
                    __designTimeSelection(NavigationLink(destination: __designTimeSelection(HomeScreenView(), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[2].arg[0].value")) {
                        __designTimeSelection(Label(__designTimeString("#4537_13", fallback: "Sign in with Google!"), systemImage: __designTimeString("#4537_14", fallback: "globe"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: __designTimeInteger("#4537_15", fallback: 300), height: __designTimeInteger("#4537_16", fallback: 50))
                            .background(__designTimeSelection(Color.brown, "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[2].arg[1].value.[0].modifier[3].arg[0].value"))
                            .cornerRadius(__designTimeInteger("#4537_17", fallback: 10)), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[2].arg[1].value.[0]")
                    }, "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[2]")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity), "#4537.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1]") // Ensures the content fills the screen
            }, "#4537.[1].[0].property.[0].[0].arg[0].value.[0]") //z-stack
        }, "#4537.[1].[0].property.[0].[0]") //nav stack
    }
}


#Preview {
    WelcomeScreenView()
}
