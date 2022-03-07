//
//  LemonIcon.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct LemonIcon: View {
    // Dimensions & Placement
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment
    
    var body: some View {
        Image("icon")
            .resizable()
            .frame(width: width, height: height, alignment: alignment)

    }
}

struct LemonIcon_Previews: PreviewProvider {
    static var previews: some View {
        LemonIcon(width: 35, height: 35, alignment: .center)
    }
}
