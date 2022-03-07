//
//  ElevatedRectFrameView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct ElevatedRectFrameView: View {
    // Content
    let content: String
    
    /*
     * UI
     */
    
    // Text
    let backgroundColor: Color
    let onBackgroundColor: Color
    let font: Font = UIConstants.BODY_TEXT_FONT
    let fontWeight: Font.Weight = .medium
    
    // Rectangle
    let width: CGFloat
    let height: CGFloat = UIConstants.RECT_FRAME_HEIGHT
    let padding: CGFloat = UIConstants.RECT_FRAME_PADDING
    let cornerRadius: CGFloat = UIConstants.RECT_FRAME_RADIUS

    
    var body: some View {
            RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
                .fill(backgroundColor)
                .frame(width: width+padding, height: height, alignment: .center)
                .overlay(
                    Text(content)
                        .foregroundColor(onBackgroundColor)
                        .font(font)
                        .background(backgroundColor)
                        .frame(width: width, height: height, alignment: .center)
                )
    }
}

struct ElevatedRectFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ElevatedRectFrameView(
            content: "Lorem ipsum dolor sit amet.",
            backgroundColor: .yellow,
            onBackgroundColor: .white,
            width: 75)
    }
}
