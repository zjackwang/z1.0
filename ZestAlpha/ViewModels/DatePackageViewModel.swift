//
//  DatePackageViewModel.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

class DatePackageViewModel: ObservableObject {
    /*
     * MARK: Initialization
     */
    static let shared = DatePackageViewModel()
    
    @ObservedObject var pvm = PersonalViewModel.shared

    
    // Searching/Displaying
    @Published var searchText: String = ""
    @Published var datePackages: [DatePackage] = []
    
    // Popups
    @Published var showPackageDescription: Bool = false
    @Published var shownInfo: String = ""
    
    let samples = DatePackage.samples
    
    private init() {
        datePackages = samples
    }
    
    /*
     * MARK: FUNCTION
     */
    
    func userSearched(for searchText: String) {
        if !searchText.isEmpty {
            datePackages = Searching.filterPackagesByNameAndDescription(searchText: searchText, datePackages: samples)
        } else {
            datePackages = samples
        }
    }
    
    func toggleDatePackageFavorite(for dateName: String){
        if let row = self.datePackages.firstIndex(where: {$0.Name == dateName}) {
            datePackages[row].isFavorited.toggle()
            if datePackages[row].isFavorited {
                pvm.addSavedPackage(datePackage: datePackages[row])
            } else {
                pvm.removeSavedPackage(datePackage: datePackages[row])
            }
        } else {
            return 
        }
    }
    
    
    
    /*
     * Get test image LOGO
     */
    func getLogoTEST(for logo: String) -> Image{
        // TODO: if logo not named then fails??
//        let uiImage =   UIImage(systemName: "photo.fill")! // (UIImage(named: logo) ??
        return Image(logo)
    }


    /*
     * MARK: Heart Icon
     */
    
}
