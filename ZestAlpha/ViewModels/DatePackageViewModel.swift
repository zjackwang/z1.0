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

    
    @Published var searchText: String = ""
    @Published var datePackages: [DatePackage] = []
    
    let samples = DatePackage.samples
    
    private init() {
        datePackages = samples
    }
    
    /*
     * MARK: FUNCTION
     */
    
    func userSearched(for searchText: String) {
        if !searchText.isEmpty {
            filterPackagesByNameAndDescription(searchText: searchText)
        } else {
            datePackages = samples
        }
    }
    
    func filterPackagesByNameAndDescription(searchText: String) {
        // Filter packages (w/ priority)
        //  1. By Title
        //  2. By Package Description
        
        var searchedPackages: [DatePackage] = []
        
        let searchTextLowerCase = searchText.lowercased()
        // How fast does this run w/ 1,000? prob pretty fast still 
        searchedPackages.append(
            contentsOf:
                samples.filter({
                    $0.Name.lowercased().contains(searchTextLowerCase)
                        || $0.BusinessName.lowercased().contains(searchTextLowerCase)
                        || $0.PackageDescription.lowercased().contains(searchTextLowerCase)
                })
                .sorted(
                    by: { $0.Name.lowercased().contains(searchTextLowerCase) && !$1.Name.lowercased().contains(searchTextLowerCase)}
                )
        )
        
        datePackages = searchedPackages
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
