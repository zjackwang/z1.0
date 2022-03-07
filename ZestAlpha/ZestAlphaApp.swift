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

    private var isCurrentUserSignedIn = SettingsViewModel.shared.isUserSignedIn
    
    init() {
        // Allows background color
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isCurrentUserSignedIn {
                    MainView()
                        .transition(
                            .asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))
                        )
                } else {
                    OnboardingView()
                        .transition(
                            .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom))
                        )
                }
            }
        }
    }
}
