//
//  SearchBarView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct SearchBarView: View {
    
    // Content (Read From User Input)
//    @Binding private var searchTest = ""
    
    var body: some View {
        Text("Searching for ")
    }
}

struct DisplaySearchBar: View {
    // Content (Read From User Input)
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText)
                .navigationTitle("Searchable Example")
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
