//
//  DatePackageView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct DatePackageView: View {
    // Date to show
    var datePackage: DatePackage
    
    // UI
    let background = UIConstants.BG_COLOR
    let columns = UIConstants.DATE_PKG_COLUMNS
    
    /*
     * View Models
     */
    @StateObject var dpvm = DatePackageViewModel.shared
    
    /*
     * Controls
     */
    
    var body: some View {
        LazyVGrid(columns: columns) {
            LogoView(logo: dpvm.getLogoTEST(for: datePackage.LogoURLString), isFavorited: datePackage.isFavorited)
            ZestyDescriptionView(description: datePackage.ZestyDescription)
            PackageDescriptionView(description: datePackage.PackageDescription)
        }
        .listRowBackground(background)
    }
}

struct DatePackageView_Previews: PreviewProvider {
    static var previews: some View {
        DatePackageView(datePackage: DatePackage.samples[0])
    }
}
