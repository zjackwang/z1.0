//
//  PersonalViewModel.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/6/22.
//

import SwiftUI

class PersonalViewModel: ObservableObject {
    
    static let shared = PersonalViewModel()
    private init() {}

    // Core Data in phase 2
    @Published var savedDatePackages: [DatePackage] = []
    
    
    func hasSavedPackages() -> Bool {
        return !savedDatePackages.isEmpty
    }
    
    /*
     * TESTING Functions
     */
    func addSavedPackage(datePackage: DatePackage) {
        print(datePackage)
        savedDatePackages.append(datePackage)
    }
    func removeSavedPackage(datePackage: DatePackage) {
        savedDatePackages.removeAll(where: {$0.Name == datePackage.Name})
    }
    
    
}
