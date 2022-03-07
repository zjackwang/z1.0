//
//  ZestAlphaApp.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

@main
struct ZestAlphaApp: App {

    @Environment(\.scenePhase) private var scenePhase

    @AppStorage("signed_in") private var currentUserSignedIn: Bool = false
    
    init() {
        // Background color
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                // Background
//                LinearGradient(
//                    colors: [Color.purple, .black],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing)
//                    .ignoresSafeArea()
                
                if currentUserSignedIn {
                    MainView()
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                } else {
                    OnboardingView()
                        .transition(
                            .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                }
            }
        }
    }
}
