//
//  HeartIconView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct HeartIconView: View {
    
    /*
     * UI
     */
    
    // Constants
    let heartIconWidth: CGFloat = UIConstants.HEART_WIDTH
    let filledColor: Color = UIConstants.HRT_FILLED_COLOR
    let unfilledColor: Color = UIConstants.HRT_UNFILLED_COLOR
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: heartIconWidth))
            .foregroundColor(filledColor)
            .frame(maxWidth: heartIconWidth)
    }
}

struct HeartIconView_Previews: PreviewProvider {
    static var previews: some View {
        HeartIconView()
    }
}
