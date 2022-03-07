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
    var savedDatePackages: [DatePackage] = []
    
    @Published var searchText: String = ""
    @Published var searchedDatePackages: [DatePackage] = []
    func hasSavedPackages() -> Bool {
        return !savedDatePackages.isEmpty
    }
    
    /*
     * TESTING Functions
     */
    func addSavedPackage(datePackage: DatePackage) {
        print(datePackage)
        savedDatePackages.append(datePackage)
        searchedDatePackages.append(datePackage)
    }
    func removeSavedPackage(datePackage: DatePackage) {
        savedDatePackages.removeAll(where: {$0.Name == datePackage.Name})
        searchedDatePackages.removeAll(where: {$0.Name == datePackage.Name})
    }
    
    /*
     * MARK: FUNCTION
     */
    func userSearched(for searchText: String) {
        if !searchText.isEmpty {
            searchedDatePackages = Searching.filterPackagesByNameAndDescription(searchText: searchText, datePackages: savedDatePackages)
        } else {
            searchedDatePackages = savedDatePackages
        }
    }
    
}
