//
//  PackageDescriptionView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct PackageDescriptionView: View {
    let description: String
    
    // UI
    let backgroundColor: Color = UIConstants.SURFACE_COLOR
    let onBackgroundColor: Color = UIConstants.ON_SURFACE_COLOR
    let width: CGFloat = UIConstants.PKG_DESC_WIDTH
    
    var body: some View {
        ElevatedRectFrameView(
            content: description,
            backgroundColor: backgroundColor,
            onBackgroundColor: onBackgroundColor,
            width: width
        )
        .onTapGesture {
            print("DEV >> Opening booking view")
        }
    }
}

struct PackageDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PackageDescriptionView(
            description: "Lorem ipsum dolor sit amet."
        )
    }
}
