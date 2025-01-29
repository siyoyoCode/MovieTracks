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
                __designTimeSelection(Color(hue: __designTimeFloat("#8734_0", fallback: 0.696), saturation: __designTimeFloat("#8734_1", fallback: 0.394), brightness: __designTimeFloat("#8734_2", fallback: 0.34))
                    .ignoresSafeArea(), "#8734.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")

                __designTimeSelection(VStack {
                    __designTimeSelection(NavigationLink(destination: __designTimeSelection(HomeScreenView(), "#8734.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value")) {
                        __designTimeSelection(Label(__designTimeString("#8734_3", fallback: "click here to go to home"), systemImage: __designTimeString("#8734_4", fallback: "globe"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: __designTimeInteger("#8734_5", fallback: 300), height: __designTimeInteger("#8734_6", fallback: 50))
                            .background(__designTimeSelection(Color.brown, "#8734.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].modifier[3].arg[0].value"))
                            .cornerRadius(__designTimeInteger("#8734_7", fallback: 10)), "#8734.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0]")
                    }, "#8734.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0]")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity), "#8734.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[1]") // Ensures the content fills the screen
            }, "#8734.[1].[0].property.[0].[0].arg[0].value.[0]") //z-stack
        }, "#8734.[1].[0].property.[0].[0]") //nav stack
    }
}


#Preview {
    WelcomeScreenView()
}
