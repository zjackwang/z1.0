//
//  BackButton.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/6/22.
//

import SwiftUI

struct BackArrow: View {
    // Dimensions & Placement
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment
    
    var font: Font
    var color: Color 
    
    var body: some View {
        Image(systemName: "arrowshape.turn.up.backward.circle")
            .resizable()
            .font(font)
            .foregroundColor(color)
            .frame(width: width, height: height, alignment: alignment)
    }
}
