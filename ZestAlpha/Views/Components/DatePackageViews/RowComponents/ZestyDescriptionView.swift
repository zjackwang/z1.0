//
//  ZestyDescriptionView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct ZestyDescriptionView: View {
    let description: String
    
    // UI
    let backgroundColor: Color = UIConstants.SURFACE_COLOR
    let onBackgroundColor: Color = UIConstants.ON_SURFACE_COLOR
    let width: CGFloat = UIConstants.ZESTY_DESC_WIDTH
    
    var body: some View {
        ElevatedRectFrameView(
            content: description,
            backgroundColor: backgroundColor,
            onBackgroundColor: onBackgroundColor,
            width: width
        )
            
    }
}

struct ZestyDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ZestyDescriptionView(
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies, enim facilisis ullamcorper aliquam"
        )
    }
}
