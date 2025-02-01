import func SwiftUI.__designTimeSelection

import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/siyoyodh/Coding/MooovieTracks/MooovieTracks/Views/HomeScreenView.swift", line: 1)
//
//  HomeScreenView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 1/29/25.
//
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        __designTimeSelection(Text(__designTimeString("#10908_0", fallback: "aloha we are at home!!")), "#10908.[1].[0].property.[0].[0]")
        
        __designTimeSelection(HStack(spacing: __designTimeInteger("#10908_1", fallback: 10)){
            __designTimeSelection(Text(__designTimeString("#10908_2", fallback: "Browse")), "#10908.[1].[0].property.[0].[1].arg[1].value.[0]")
            
            __designTimeSelection(Text(__designTimeString("#10908_3", fallback: "List")), "#10908.[1].[0].property.[0].[1].arg[1].value.[1]")
            
            __designTimeSelection(Text(__designTimeString("#10908_4", fallback: "My Account")), "#10908.[1].[0].property.[0].[1].arg[1].value.[2]")
        }, "#10908.[1].[0].property.[0].[1]")
    }
}

#Preview {
    HomeScreenView()
}
