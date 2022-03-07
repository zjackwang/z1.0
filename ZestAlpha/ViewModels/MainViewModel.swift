//
//  MainViewModel.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    static let shared = MainViewModel()
    private init() {}
    
    
    @Published var state: ViewStates = .home
    @Published var isLoading = false

    @Published var showBusinessInfo: Bool = false
    
    func lemonIconPressed() {
        withAnimation(.easeInOut) {
            state = state == .home ? .personal : .home
        }
    }
    
    func backButtonPressed() {
        withAnimation(.easeOut) {
            state = .home
        }
    }
    
}
