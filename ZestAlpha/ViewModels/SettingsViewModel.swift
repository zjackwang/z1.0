//
//  SettingsViewModel.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/7/22.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    /*
     * MARK: Initialization
     */
    
    static let shared = SettingsViewModel()
    private init() {}
    
    // User Defaults
    @AppStorage("name") var name: String = ""
    @AppStorage("username") var username: String = ""
    @AppStorage("isSignedIn") var isUserSignedIn: Bool = false
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
}
