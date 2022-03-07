//
//  Searching.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/7/22.
//

import Foundation

class Searching {
    static func filterPackagesByNameAndDescription(searchText: String, datePackages: [DatePackage]) -> [DatePackage]{
        // Filter packages (w/ priority)
        //  1. By Title
        //  2. By Package Description
        
        var searchedPackages: [DatePackage] = []
        
        let searchTextLowerCase = searchText.lowercased()
        // How fast does this run w/ 1,000? prob pretty fast still
        searchedPackages.append(
            contentsOf:
                datePackages.filter({
                    $0.Name.lowercased().contains(searchTextLowerCase)
                        || $0.BusinessName.lowercased().contains(searchTextLowerCase)
                        || $0.PackageDescription.lowercased().contains(searchTextLowerCase)
                })
                .sorted(
                    by: { $0.Name.lowercased().contains(searchTextLowerCase) && !$1.Name.lowercased().contains(searchTextLowerCase)}
                )
        )
        
        return searchedPackages
    }
}
