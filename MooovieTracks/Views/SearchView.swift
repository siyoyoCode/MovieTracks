//
//  SearchView.swift
//  MooovieTracks
//
//  Created by Siyona Dhingra on 7/23/25.
//

import SwiftUI

struct SearchView: View {
    @State private var userSearch = ""
    @State private var searchResults: [MovieData] = []
    
    var body: some View {
    
        HStack{
            Image(systemName: "magnifyingglass.circle.fill")
                .foregroundColor(.gray)
                
            TextField("What movie are you looking for?", text: $userSearch)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    Task {
                        do {
                            searchResults = try await searchDatabase(userQuery: userSearch)
                            for movie in searchResults {
                                print("title: \(movie.title)")
                            }
                        } catch {
                            print("API Search Database failed")
                        }
                    }
                }
        }
        .padding()
        
    }
        
}

#Preview {
    SearchView()
}

