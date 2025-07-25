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
    @State private var searchedYet: Bool = false
    
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
                            
                            searchedYet = true
                        } catch {
                            print("API Search Database failed")
                        }
                    }
                    
                    
                }
        }
        .padding()
        
        //displays resulting movies
        if !searchResults.isEmpty {
            
            VStack {
                Text("Results:")
                    .font(.callout)
                    .foregroundColor(.secondary)

                    
                MovieScrollerView(movieSearchResults: searchResults)

            }
        } else if searchedYet {
            Text("No such title. Please try another title.")
                .font(.subheadline)
        }
    }
        
}

#Preview {
    SearchView()
}

